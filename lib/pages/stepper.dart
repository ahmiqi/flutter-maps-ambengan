import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Flutter Stepper Demo'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Area of Interest'),
                      subtitle: Text('Polygonal Area'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Email Address'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Analysis Result'),
                      subtitle: Text('Vegetation Health Index'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Home Address'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Postcode'),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Are Identity'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Mobile Number'),
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
