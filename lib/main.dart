import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/providers/get_it.dart';
import 'package:obsidian_clipper/routes/auto_route.dart';

class CustomTheme {
  final ThemeData themeData;

  // Private constructor
  CustomTheme._(this.themeData);

  factory CustomTheme(Brightness brightness) {
    return CustomTheme._(
      ThemeData(
        brightness: brightness,
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(filled: true),
      ),
    );
  }
}

class Themes {
  static final lightTheme = CustomTheme(Brightness.light).themeData.copyWith(
        primaryColor: Colors.orange,
      );
  static final darkTheme = CustomTheme(Brightness.dark).themeData.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(218, 0, 255, 1), brightness: Brightness.dark),
      );
}

void initLogging() {
  Logger.root.level = Level.ALL; // Capture all logs.
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLogging();
  await configureDependencies();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _appRouter.config(),
    );
  }
}
