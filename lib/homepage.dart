import 'dart:io';

import 'package:flutter/material.dart';
import 'package:filesystem_picker/filesystem_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.count});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int count;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _output = '';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void _updateOutput() {
    setState(() {
      _output = 'The current count is $_counter';
    });
  }

  Future<void> openFolder() async {
  // Show the file picker dialog
  String? filePath = await FilesystemPicker.open(
    title: 'Select a folder',
    context: context,
    rootDirectory: Directory('/'), // Set the initial directory
    fsType: FilesystemType.folder,
    pickText: 'Select',
    folderIconColor: Colors.teal,
  );

  // Handle the selected file path
  if (filePath != null) {
    // Use the selected file path
    print('Selected file: $filePath');
  } else {
    // No file selected
    print('No file selected');
  }

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("${widget.title}.${widget.count}"),
      ),
      body: ListView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: openFolder,
              child: const Text('Open Folder'),
            ),
            Padding(
              padding: newMethod(),
              child: const Text(
                'You have click the button this many times:',
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              ElevatedButton(onPressed: () {
                _updateOutput();
              }, child: const Text('Click me')),
              Text('Output: $_output'),
            ])
          ],
        )],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  EdgeInsets newMethod() => const EdgeInsets.all(20.0);
}
