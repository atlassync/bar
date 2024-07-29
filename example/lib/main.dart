import 'package:bar/bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }

  ThemeData get darkTheme => ThemeData.dark(useMaterial3: true).copyWith(
        extensions: [
          const BarTheme(
            backgroundColor: Colors.black54,
            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 0.0),
            border: Border(
              right: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
        ],
      );

  ThemeData get lightTheme => ThemeData.light(useMaterial3: true).copyWith(
        extensions: [
          const BarTheme(
            backgroundColor: Colors.white54,
            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 0.0),
            border: Border(
              right: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
        ],
      );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Bar(
            controller: BarController(),
            header: const FlutterLogo(),
            mode: BarMode.auto,
            elements: _elements,
          ),
        ],
      ),
    );
  }

  List<BarElement> get _elements =>  [
        const BarGap(16),
        BarItem(
          leading: (_) => const Icon(Icons.home),
          title: (_) => 'Home',
          trailing: (_) => const Icon(Icons.sunny),
        ),
        const BarGap(16),
        BarItem(
          leading: (_) => const Icon(Icons.message_rounded),
          title: (_) => 'Messages',
        ),
        const BarGap(16),
        const BarDivider(),
        const BarGap(16),
        const BarAdapter(FlutterLogo())
      ];
}
