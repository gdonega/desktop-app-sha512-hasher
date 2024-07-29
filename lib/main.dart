import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hashs',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hasher SHA256'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final inputController = TextEditingController();
  final output256Controller = TextEditingController();
  final outputSubstringController = TextEditingController();
  bool passwordInvisible = true;

  void calcSubstring(indexEnd) {
    if (output256Controller.text.isEmpty) {
      return;
    }

    outputSubstringController.text =
        output256Controller.text.substring(0, indexEnd);

    Clipboard.setData(ClipboardData(text: outputSubstringController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputController,
              obscureText: passwordInvisible,
              decoration: const InputDecoration(
                hintText: "Input to be hashed",
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                outputSubstringController.text = "";

                if (inputController.text.isEmpty) {
                  output256Controller.text = "";
                  return;
                }

                output256Controller.text = sha512
                    .convert(utf8.encode(inputController.text))
                    .toString();
              },
            ),
            TextField(
              controller: output256Controller,
              obscureText: passwordInvisible,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: "SHA256 Output",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: output256Controller.text));
              },
              child: const Text("Copy All characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(120);
              },
              child: const Text("Substring and Copy first 120 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(110);
              },
              child: const Text("Substring and Copy first 110 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(100);
              },
              child: const Text("Substring and Copy first 100 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(80);
              },
              child: const Text("Substring and Copy first 80 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(60);
              },
              child: const Text("Substring and Copy first 60 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(40);
              },
              child: const Text("Substring and Copy first 40 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(20);
              },
              child: const Text("Substring and Copy first 20 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(10);
              },
              child: const Text("Substring and Copy first 10 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(8);
              },
              child: const Text("Substring and Copy first 8 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(6);
              },
              child: const Text("Substring and Copy first 6 characters"),
            ),
            ElevatedButton(
              onPressed: () {
                calcSubstring(4);
              },
              child: const Text("Substring and Copy first 4 characters"),
            ),
            TextField(
              controller: outputSubstringController,
              obscureText: passwordInvisible,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: "Substring output",
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(' Hide text '),
                Switch(
                  value: passwordInvisible,
                  activeColor: Colors.red,
                  onChanged: (bool value) {
                    setState(() {
                      passwordInvisible = !passwordInvisible;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
