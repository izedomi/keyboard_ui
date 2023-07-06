import 'package:flutter/material.dart';

import 'number_input_one.dart';
import 'number_input_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KeyboardInteraction(),
    );
  }
}

class KeyboardInteraction extends StatefulWidget {
  const KeyboardInteraction({Key? key}) : super(key: key);

  @override
  State<KeyboardInteraction> createState() => _KeyboardInteractionState();
}

class _KeyboardInteractionState extends State<KeyboardInteraction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NumberInputOne()),
                );
              },
              child: const Text("Number Input One")),
          const SizedBox(height: 3),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NumberInputTwo()),
                );
              },
              child: const Text("Number Input two"))
        ],
      ),
    ));
  }
}
