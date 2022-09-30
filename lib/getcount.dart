import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controller.dart';

class GetCount extends StatefulWidget {
  const GetCount({Key? key}) : super(key: key);

  @override
  State<GetCount> createState() => _GetCountState();
}

class _GetCountState extends State<GetCount> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.increase();
            },
            child: Center(child: Icon(Icons.add))),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Obx(() => Text(controller.count.toString())),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => Counted());
                  },
                  child: Center(child: Text('Counter Saved'))),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Center(child: Text('Back')))
            ],
          ),
        ));
  }
}

class Counted extends StatelessWidget {
  Counted({Key? key}) : super(key: key);
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(controller.count.toString()),
      ),
    );
  }
}
