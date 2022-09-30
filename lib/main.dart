import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/getcount.dart';
import 'package:getxdemo/sharelinkdemo.dart';
import 'model.dart';

void main() {
  runApp(GetMaterialApp(
    locale: Get.deviceLocale,
    home: GetCount(),
    debugShowCheckedModeBanner: false,
  ));
}

class GetXDemo extends StatefulWidget {
  const GetXDemo({Key? key}) : super(key: key);

  @override
  State<GetXDemo> createState() => _GetXDemoState();
}

class _GetXDemoState extends State<GetXDemo> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  var step = 0; // var step value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stepper(
        //Stepper demo
        currentStep: step,
        type: StepperType.horizontal,
        onStepContinue: () {
          if (step < (list()!.length - 1)) {
            setState(() {
              step += 1;
            });
          }
        },
        onStepCancel: () {
          if (step == 0) {
            return;
          }
          setState(() {
            step -= 1;
          });
        },
        elevation: 5,
        onStepTapped: (value) {
          setState(() {
            step = value;
          });
        },
        steps: list()!,
      ))),
    );
  }

  List<Step>? list() {
    return [
      Step(
        isActive: step == 0,
        title: Text('demo1'),
        content: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                label: Text('Name'),
                hintText: 'Enter name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: email,
                decoration: InputDecoration(
                    label: Text('Email'), hintText: 'Enter email'))
          ],
        ),
        state: step == 0 ? StepState.indexed : StepState.complete,
        subtitle: Text(' Are you sure?'),
      ),
      Step(
          isActive: step == 1,
          title: Text('demo2'),
          content: Column(
            children: [
              Text(name.text),
              SizedBox(
                height: 5,
              ),
              Text(email.text)
            ],
          ),
          state: step == 1 ? StepState.indexed : StepState.complete),
      Step(
          isActive: step == 2,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 30,
              ),
              Text(
                "Success!",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          state: step == 2 ? StepState.indexed : StepState.complete,
          title: Text(''))
    ];
  }
}
