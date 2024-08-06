import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          const SideBarTheme(
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
          const SideBarTheme(
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
          SideBar(
            controller: SideBarController(),
            header: const FlutterLogo(),
            mode: SideBarMode.auto,
            elements: _elements,
          ),
        ],
      ),
    );
  }

  List<SideBarElement> get _elements => [
        const SideBarGap(16),
        SideBarItem(
          leading: (_) => const Icon(Icons.home),
          title: (_) => 'Home',
          trailing: (_) => const Icon(Icons.sunny),
        ),
        const SideBarGap(16),
        SideBarItem(
          leading: (_) => const Icon(Icons.message_rounded),
          title: (_) => 'Messages',
        ),
        const SideBarGap(16),
        const SideBarDivider(),
        const SideBarGap(16),
        const SideBarAdapter(FlutterLogo())
      ];
}
