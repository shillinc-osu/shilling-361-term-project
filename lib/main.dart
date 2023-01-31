import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/cityscreen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.defaultTheme});

  final bool defaultTheme;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkMode = widget.defaultTheme;
  final ThemeData _darkMode = ThemeData(brightness: Brightness.dark);
  final ThemeData _lightMode = ThemeData(brightness: Brightness.light);

  void swapTheme(bool val) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('theme', val);

    setState(() {
      _isDarkMode = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: _isDarkMode ? _darkMode : _lightMode,
        home: CityScreen(
            swapTheme: swapTheme,
            isInDarkMode: _isDarkMode,
            name: "Placeholder Name 1"));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool defaultTheme = prefs.getBool('theme') ?? false;
  runApp(MyApp(defaultTheme: defaultTheme));
}
