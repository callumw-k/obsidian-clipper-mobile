import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/providers/dio.dart';
import 'package:obsidian_clipper/providers/get_it.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onResult});

  final Function(bool result) onResult;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final logger = Logger('MyHomePage');

  final _formKey = GlobalKey<FormBuilderState>();
  final dio = getIt.get<AuthDioClient>();

  void _login(String email, String password) async {
    final response = await dio.client.post('/login', data: {'email': email, 'password': password});
    var token = response.data['access_token'] as String?;
    if (token != null && token.isNotEmpty) {
      await dio.storeAndSetToken(token);
      widget.onResult(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      autofillHints: [AutofillHints.email],
                      decoration: InputDecoration(labelText: 'Email'),
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
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          var valid = _formKey.currentState?.saveAndValidate() ?? false;

                          if (!valid) return;

                          final email = _formKey.currentState?.value['email'];
                          final password = _formKey.currentState?.value['password'];

                          logger.fine('Email and password is $email, $password');

                          _login(email, password);
                        },
                        child: Text('Submit'),
                      ),
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
