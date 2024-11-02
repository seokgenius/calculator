import 'package:calculator/screens/calculator_1.dart';
import 'package:calculator/screens/calculator_2.dart';
import 'package:calculator/screens/calculator_3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedNaviIndex = 0;      // _selectedNaviIndex 변수 정의와 이벤트 핸들러 시작

  _onBottomNavigationItemTapped(index) {
    setState(() {
      _selectedNaviIndex = index;
    });
  }

  var pages = [
    FirstCalculator(),
    SecondCalculator(),
    ThirdCalculator()
  ];

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: pages[_selectedNaviIndex],

      bottomNavigationBar: BottomNavigationBar(
        // bottomNavigationBar 시작
        onTap: _onBottomNavigationItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one, color: Colors.blue),
            label: "Calculate 1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two, color: Colors.blue),
            label: "Calculate 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3, color: Colors.blue),
            label: "Calculate 3",
          ),
        ],
      ),
    );
  }
}
