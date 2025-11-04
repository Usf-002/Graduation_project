import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mentalevaluation_model.dart';

class MentalEvaluationWidget extends StatelessWidget {
  MentalEvaluationWidget({Key? key}) : super(key: key); // No 'const' here

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MentalEvaluationModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Assessment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              ...List.generate(53, (index) {
                return QuestionWidget(
                  questionNumber: index + 1,
                  questionText: getQuestionText(index),
                  groupValue: model.selectedAnswers[index],
                  onChanged: (value) {
                    model.updateFeature(index, value);
                  },
                );
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: model.getPrediction,
                child: Text('Get Prediction'),
              ),
              SizedBox(height: 20),
              Text('Connectivity: ${model.connectivityStatus}'),
              SizedBox(height: 20),
              Text('Condition: ${model.condition}'),
            ],
          ),
        ),
      ),
    );
  }

  String getQuestionText(int index) {
    List<String> questions = [
      'Do you experience inflated self-esteem?',
      'Do you have intrusive memories or flashbacks?',
      'Do you have angry outbursts?',
      'Have you experienced symptoms for 1 month or longer?',
      'Do you feel irritable?',
      'Do you experience a depressed mood?',
      'Do you have dissociative reactions?',
      'Do you have thoughts of suicide?',
      'Do you avoid external reminders of a traumatic event?',
      'Do you experience a decreased need for sleep?',
      'Do you have sleep disturbances?',
      'Do you experience persistent loss of memory about the cause or consequences of a traumatic event?',
      'Do you exhibit catatonic behavior?',
      'Do you have an increase in goal-directed activity?',
      'Do you have difficulty concentrating?',
      'Have you experienced symptoms for 6 months or longer?',
      'Do you experience persistent inability to experience positive emotions?',
      'Do you have delusions?',
      'Do you have difficulty concentrating or making decisions?',
      'Do you feel restless?',
      'Do you engage in reckless behavior?',
      'Do you experience intense distress or reaction when exposed to cues affiliated with a traumatic event?',
      'Have you experienced symptoms for more than one month?',
      'Are your disturbances not substance-induced?',
      'Do you experience psychomotor agitation?',
      'Do you experience fatigue or loss of energy?',
      'Do you have concentration issues?',
      'Do you avoid reminders of a traumatic event?',
      'Do you experience recurrent distressing dreams affiliated with a traumatic event?',
      'Have you experienced weight loss or gain?',
      'Do you find yourself more talkative than usual?',
      'Do you experience excessive worry or fear?',
      'Do you have intrusive memories or flashbacks?',
      'Do you have persistent and exaggerated negative beliefs about yourself or the world?',
      'Do you experience exaggerated startle responses?',
      'Do you experience persistent sadness or low mood?',
      'Do you feel detached from others?',
      'Do you experience hallucinations?',
      'Do you have disorganized thinking or speech?',
      'Are you hypervigilant?',
      'Do you have racing thoughts?',
      'Do you experience distractibility?',
      'Do you exhibit diminished emotional expression?',
      'Do you experience sleep disturbances?',
      'Do you experience fatigue?',
      'Do your disturbances cause clinically significant distress?',
      'Do you have a loss of interest or pleasure in activities?',
      'Do you experience a lack of sleep or oversleeping?',
      'Have you witnessed a traumatic event?',
      'Do you experience a persistent negative emotional state?',
      'Do you experience diminished interest in activities?',
      'Do you engage in excessive involvement in activities with high potential for painful consequences?',
      'Have you experienced a traumatic event?',
    ];
    return questions[index];
  }
}

class QuestionWidget extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final int groupValue;
  final ValueChanged<int> onChanged;

  QuestionWidget({
    required this.questionNumber,
    required this.questionText,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Question $questionNumber: $questionText'),
        Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text('Yes'),
                leading: Radio<int>(
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) {
                    onChanged(value!);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('No'),
                leading: Radio<int>(
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (value) {
                    onChanged(value!);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
