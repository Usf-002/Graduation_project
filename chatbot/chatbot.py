import json
import numpy as np
import pickle
import random
import tensorflow as tf
from tensorflow.keras.models import load_model
from nltk.stem import WordNetLemmatizer
import nltk


with open('intents.json') as file:
    intents = json.load(file)

model = load_model('chatbot_model.keras')

words = pickle.load(open('words.pkl', 'rb'))
classes = pickle.load(open('classes.pkl', 'rb'))
context_sets = pickle.load(open('context_sets.pkl', 'rb'))

lemmatizer = WordNetLemmatizer()
nltk.download('punkt')
nltk.download('wordnet')


context = {}

def clean_up_sentence(sentence):
    sentence_words = nltk.word_tokenize(sentence)
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    return sentence_words

def bow(sentence, words, show_details=True):
    sentence_words = clean_up_sentence(sentence)
    bag = [0]*len(words)  
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s: 
                bag[i] = 1
                if show_details:
                    print(f"found in bag: {w}")
    return np.array(bag)

def predict_class(sentence, model, user_id):
    p = bow(sentence, words, show_details=False)
    

    context_input = [0] * len(context_sets)
    if user_id in context and context[user_id] in context_sets:
        context_input[context_sets.index(context[user_id])] = 1
    
    input_data = np.concatenate([p, context_input])
    
    
    if input_data.shape[0] != model.input_shape[1]:
        padding_length = model.input_shape[1] - input_data.shape[0]
        input_data = np.pad(input_data, (0, padding_length), 'constant')
        
    res = model.predict(np.array([input_data]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list

def get_response(ints, intents_json, user_id):
    if not ints:
        return "Sorry, I do not understand..."
    
    tag = ints[0]['intent']
    list_of_intents = intents_json['intents']
    
    result = "Sorry, I do not understand..."
    for i in list_of_intents:
        if i['tag'] == tag:
            if 'context_set' in i:
                context[user_id] = i['context_set']
            if not 'context_filter' in i or (user_id in context and 'context_filter' in i and i['context_filter'] == context[user_id]):
                result = random.choice(i['responses'])
                break
    return result

def chatbot_response(text, user_id):
    ints = predict_class(text, model, user_id)
    res = get_response(ints, intents, user_id)
    return res


print("Start conversation")
while True:
    user_id = "user1"  
    message = input("You: ")
    if message.lower() == "quit":
        break
    response = chatbot_response(message, user_id)
    print(f"Bot: {response}")
