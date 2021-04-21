import 'package:flavour_example/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.read(flavorConfigProvider).state.appTitle,
      theme: context.read(flavorConfigProvider).state.theme,
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(context.read(flavorConfigProvider).state.appTitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read(flavorConfigProvider).state.appTitle),
      ),
      body: Image.asset(
        context.read(flavorConfigProvider).state.imageLocation,
        fit: BoxFit.cover,
      ),
    );
  }
}

var flavorConfigProvider = StateProvider((ref) => FlavorConfig());
