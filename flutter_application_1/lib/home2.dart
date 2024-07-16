import 'package:flutter/material.dart';

void main(List<String> args) {
  //runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "proyekku",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 33, 243, 100)),
            useMaterial3: true),
        home: Dashboard());
        
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('saya 1'),
          Text('saya 2'),
          Center(child: Text('hello reno')),
          Image.asset("assets/image/reno.jpeg", height: 200, width: 200,),
        ],
      ),
    );
  }
}
