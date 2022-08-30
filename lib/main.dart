import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/dependency_injection.dart';


void main() {
  runApp(const MyApp());
  DependencyInjection.init(); //Here we are calling the Dependency Injection
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[700],
        title: const Text('FLUTTER GUYS'),
        centerTitle: true,
      ),
      body: const Center()
    );
  }
}