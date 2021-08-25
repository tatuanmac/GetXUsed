import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Counter extends GetxController {
  var count = 0.obs;

  void add() {
    count++;
  }
}

class Home extends StatelessWidget {
  ///Instantiate class
  final Counter counter = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text('number: ${counter.count}'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${counter.count}', style: TextStyle(fontSize: 50))),
            ElevatedButton(
                onPressed: () {
                  Get.to(OtherScreen());
                },
                child: Text('Go to other Screen')),
            ElevatedButton(
              onPressed: () {
                Get.to(SnackBar());
              },
              child: Text('Go to the Snack Bar'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => counter.add(), child: Icon(Icons.add)),
    );
  }
}

class OtherScreen extends StatelessWidget {
  ///Instantiate Class
  final Counter otherCounter = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen Here'),
      ),
      body: Center(
        child: Obx(() => Text('Number: ${otherCounter.count}',
            style: TextStyle(fontSize: 50, color: Colors.orange))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => otherCounter.add(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class SnackBar extends StatelessWidget {
  const SnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SNACK BAR HERE'),),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar('Title', 'Message', snackPosition: SnackPosition.BOTTOM);
          },
          child: Text('Show Snackbar'),
        ),
      )
    );
  }
}
