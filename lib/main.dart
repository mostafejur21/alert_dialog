import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Alert dialog",
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  mySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  showAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: const Text("Alert"),
            content: const Text("Do you want to delete?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  mySnackBar("Delete successful", context);
                  Navigator.of(context).pop();
                },
                child: const Text("yes"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: const Text("Alert button"),
        ),
      ),
    );
  }
}
