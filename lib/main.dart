import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/providers/dio.dart';
import 'package:obsidian_clipper/providers/get_it.dart';

class Themes {
  static final lightTheme = ThemeData(brightness: Brightness.light, useMaterial3: true);
  static final darkTheme = ThemeData(brightness: Brightness.dark, useMaterial3: true);
}

void initLogging() {
  Logger.root.level = Level.ALL; // Capture all logs.
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLogging();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final logger = Logger('MyHomePage');

  final _formKey = GlobalKey<FormBuilderState>();

  void _login(String email, String password) async {
    final dio = await getIt.getAsync<AuthDioClient>();

    final response = await dio.client.post('/login', data: {'email': email, 'password': password});
    var token = response.data['access_token'] as String?;
    if (token != null && token.isNotEmpty) {
      await dio.storeAndSetToken(token);
    }
    final links = await dio.client.get('/links');
    logger.shout(links.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      autofillHints: [AutofillHints.email],
                      decoration: InputDecoration(labelText: 'Email', filled: true),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      obscureText: true,
                      autofillHints: [AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FilledButton(
                      onPressed: () {
                        var valid = _formKey.currentState?.saveAndValidate() ?? false;

                        if (!valid) return;

                        final email = _formKey.currentState?.value['email'];
                        final password = _formKey.currentState?.value['password'];

                        logger.fine('Email and password is $email, $password');

                        _login(email, password);
                      },
                      child: Text('Submit'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
