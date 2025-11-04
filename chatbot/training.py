import random
import json
import pickle
import numpy as np
import tensorflow as tf

import nltk
from nltk.stem import WordNetLemmatizer
from sklearn.utils import class_weight
from imblearn.over_sampling import SMOTE

nltk.download('wordnet')
lemmatizer = WordNetLemmatizer()

# Load intents
with open('intents.json') as file:
    intents = json.load(file)

words = []
classes = []
documents = []
context_sets = []
ignore_letters = ['?', '!', '.', ',']

for intent in intents['intents']:
    for pattern in intent['patterns']:
        word_list = nltk.word_tokenize(pattern)
        words.extend(word_list)
        documents.append((word_list, intent['tag'], intent.get('context_set', '')))
        if intent['tag'] not in classes:
            classes.append(intent['tag'])
        if 'context_set' in intent and intent['context_set'] not in context_sets:
            context_sets.append(intent['context_set'])

words = [lemmatizer.lemmatize(word.lower()) for word in words if word not in ignore_letters]
words = sorted(set(words))
classes = sorted(set(classes))
context_sets = sorted(set(context_sets))

pickle.dump(words, open('words.pkl', 'wb'))
pickle.dump(classes, open('classes.pkl', 'wb'))
pickle.dump(context_sets, open('context_sets.pkl', 'wb'))

training = []
output_empty = [0] * (len(classes) + len(context_sets))

for document in documents:
    bag = []
    word_patterns = document[0]
    word_patterns = [lemmatizer.lemmatize(word.lower()) for word in word_patterns]
    for word in words:
        bag.append(1) if word in word_patterns else bag.append(0)
    
    context_row = [0] * len(context_sets)
    if document[2]:
        context_row[context_sets.index(document[2])] = 1

    output_row = list(output_empty)
    output_row[classes.index(document[1])] = 1
    training.append(bag + context_row + output_row)

random.shuffle(training)
training = np.array(training)

trainX = training[:, :len(words) + len(context_sets)]
trainY = training[:, len(words) + len(context_sets):]


smote = SMOTE(random_state=42, k_neighbors=1)
trainX, trainY = smote.fit_resample(trainX, trainY)


class_weights = class_weight.compute_class_weight('balanced', classes=np.unique(trainY.argmax(axis=1)), y=trainY.argmax(axis=1))
class_weights = dict(enumerate(class_weights))


model = tf.keras.Sequential([
    tf.keras.layers.Dense(512, input_shape=(len(trainX[0]),), activation='relu'),
    tf.keras.layers.Dropout(0.5),
    tf.keras.layers.Dense(256, activation='relu'),
    tf.keras.layers.Dropout(0.5),
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dropout(0.5),
    tf.keras.layers.Dense(len(trainY[0]), activation='softmax')
])


adam = tf.keras.optimizers.Adam(learning_rate=0.001)
model.compile(loss='categorical_crossentropy', optimizer=adam, metrics=['accuracy'])


early_stopping = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=10, restore_best_weights=True)
reduce_lr = tf.keras.callbacks.ReduceLROnPlateau(monitor='val_loss', factor=0.2, patience=5, min_lr=0.0001)


history = model.fit(trainX, trainY, epochs=200, batch_size=32, validation_split=0.1, 
                    class_weight=class_weights, callbacks=[early_stopping, reduce_lr])


model.save('chatbot_model.keras')
print('Done')
