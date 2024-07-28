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
            duration: Duration(
              microseconds: 300,
            ),
          ),
        ],
      );

  ThemeData get lightTheme => ThemeData.light(useMaterial3: true).copyWith(
        extensions: [
          const BarTheme(
            backgroundColor: Colors.white54,
            duration: Duration(
              microseconds: 300,
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

  List<BarElement> get _elements => const [
        BarGap(16),
        BarItem(
          leading: Icon(Icons.home),
          title: 'Message',
        ),
        BarGap(16),
        BarItem(
          leading: Icon(Icons.message_rounded),
          title: 'Messages',
        ),
        BarGap(16),
        BarDivider(),
        BarGap(16),
        ExpandableBarItem(
          leading: Icon(Icons.settings),
          title: 'Settings',
          elements: [
            BarItem(
              leading: Icon(Icons.palette),
              title: 'Themes',
            ),
            BarDivider(),
            BarGap(),
            BarDivider(),
            BarItem(
              leading: Icon(Icons.language),
              title: 'Languages',
            ),
          ],
        ),
        BarAdapter(FlutterLogo())
      ];
}
