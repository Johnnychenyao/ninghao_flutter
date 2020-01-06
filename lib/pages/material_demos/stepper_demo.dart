import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0 
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stepper(
              currentStep: _currentStep,
              controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Row(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: onStepContinue,
                        child: Text('继续'),
                      ),
                      FlatButton(
                        onPressed: onStepCancel,
                        child: const Text('返回'),
                      ),
                    ],
                  );
              },
              onStepTapped: (int value) {
                setState(() {
                  _currentStep = value;
                });
              },
              onStepContinue: (){
                setState(() {
                  _currentStep < 2 ? _currentStep+= 1 : _currentStep = 0;
                });
              },
              onStepCancel: (){
                setState(() {
                  _currentStep > 0 ? _currentStep-= 1 : _currentStep = 0;
                });
              },
              steps: [
                Step(
                  title: Text('步骤1'),
                  subtitle: Text('login First'),
                  content: Text('12312424235235435423534634'),
                  isActive: _currentStep == 0
                ),
                Step(
                  title: Text('步骤2'),
                  subtitle: Text('login second'),
                  content: Text('12312424235235435423534634'),
                  isActive: _currentStep == 1
                ),
                Step(
                  title: Text('步骤13'),
                  subtitle: Text('login third'),
                  content: Text('12312424235235435423534634'),
                  isActive: _currentStep == 2
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}