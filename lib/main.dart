import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyApp은 StatefulWidget를 상속하여 앱의 상태를 관리합니다.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

// _MyApp 클래스는 MyApp의 상태를 관리합니다.
class _MyApp extends State<MyApp> {
  var switchValue = false;
  String test = 'hello'; // 버튼에 들어갈 텍스트 입력
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    // MaterialApp은 Flutter 앱의 기본 구성을 정의합니다.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // 앱의 기본 테마 색상
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        // Scaffold는 앱의 기본 레이아웃 구조를 정의합니다.
        body: Center(
          child: ElevatedButton(
            child: Text('$test'), // 버튼에 표시할 텍스트
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_color), // 버튼 배경색
            ),
            onPressed: () {
              if (_color == Colors.blue) {
                // 버튼을 누를 때마다 텍스트와 배경색 변경
                setState(() {
                  test = 'flutter';
                  _color = Colors.amber;
                });
              } else {
                setState(() {
                  test = 'hello';
                  _color = Colors.blue;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

// MyHomePage는 홈 화면의 스카폴드를 정의합니다.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState 클래스는 홈 화면의 상태를 관리합니다.
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++; // 버튼을 누를 때마다 카운터 증가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // 앱바 색상
        title: Text(widget.title), // 앱바에 표시할 제목
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:', // 텍스트
            ),
            Text(
              '$_counter', // 카운터 값
              style: Theme.of(context).textTheme.headlineMedium, // 텍스트 스타일
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 버튼 클릭 시 동작
        tooltip: 'Increment',
        child: const Icon(Icons.add), // 버튼 아이콘
      ),
    );
  }
}

