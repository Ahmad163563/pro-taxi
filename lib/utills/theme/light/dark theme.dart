// ========================= theme_manager.dart =========================
// Put this file in lib/theme_manager.dart
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light; // default

  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  void toggle(bool makeDark) {
    _mode = makeDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// ---- Light Theme ----
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB), brightness: Brightness.light),
  appBarTheme: const AppBarTheme(centerTitle: true),
  cardTheme: CardTheme(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);

// ---- Dark Theme ----
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF60A5FA), brightness: Brightness.dark),
  appBarTheme: const AppBarTheme(centerTitle: true),
  cardTheme: CardTheme(
    elevation: 1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeManager _theme = ThemeManager();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _theme,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Light/Dark Theme Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _theme.mode,
          home: HomeScreen(theme: _theme),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.theme});
  final ThemeManager theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(
                value: theme.isDark,
                onChanged: (v) => theme.toggle(v),
              ),
              const Icon(Icons.dark_mode),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Hello 👋', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Text('Toggle the switch in the AppBar to change between Light and Dark theme.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.touch_app),
              label: const Text('A Themed Button'),
            ),
          ],
        ),
      ),
    );
  }
}
