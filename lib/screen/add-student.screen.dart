import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  AddStudentScreen({Key? key}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  int _currentStep = 0;

  StepperType stepperType = StepperType.vertical;

  final nameTextController = new TextEditingController();

  final ageTextController = new TextEditingController();

  final addressTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Student', style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Column(
      //     children: [
      //       Container(
      //         child: TextField(
      //           controller: nameTextController,
      //           decoration: InputDecoration(
      //             labelText: 'Name',
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: TextField(
      //           controller: ageTextController,
      //           decoration: InputDecoration(
      //             labelText: 'Age',
      //             icon: Icons.
      //           ),
      //         ),
      //       ),
      //       Container(
      //         child: TextField(
      //           controller: addressTextController,
      //           decoration: InputDecoration(
      //             labelText: 'Address',
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 20,
      //       ),
      //       ElevatedButton(
      //         child: Text('ADD STUDENT'),
      //         onPressed: () {},
      //         style: ElevatedButton.styleFrom(
      //             primary: Colors.purple,
      //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      //             textStyle: TextStyle(
      //               fontSize: 15,
      //               fontWeight: FontWeight.bold,
      //               letterSpacing: 2,
      //             ),
      //       ),
      //       ),
      //     ],
      //   ),
      // ),
      body:Theme(
        data: ThemeData(
            accentColor: Colors.orange,
            primarySwatch: Colors.orange,
            colorScheme: ColorScheme.light(
                primary: Colors.purple
            )
        ),
        child:Container(
        child: Column(
          children: [
            Expanded(
                child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Student Name'),
                    content: TextField(
                      controller: nameTextController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Student Age'),
                    content: TextField(
                      controller: ageTextController,
                      decoration: InputDecoration(
                        labelText: 'Age',
                      ),
                    ),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Student Address'),
                    content: TextField(
                              controller: addressTextController,
                              decoration: InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
      SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  child: Text('ADD STUDENT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }

  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}
