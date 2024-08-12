import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool _showPassword = false;

  String? validateEmail(String email) {
    final emailRegex =
        RegExp(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");
    if (email.isEmpty) {
      return "Please enter your email.";
    } else if (!emailRegex.hasMatch(email)) {
      return "Please enter a valid email.";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Please enter your password.";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters.";
    }
    return null;
  }

  void _login() {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();

      debugPrint("Email: $_email, Password: $_password");
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            height: size.height,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  "Log In",
                  style: textTheme.headlineLarge,
                ),
                Text(
                  "Enter your credential to continue",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: SpacingSize.s40),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: textTheme.bodyLarge,
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return (value != null)
                              ? validateEmail(value)
                              : validateEmail("");
                        },
                        onSaved: (value) => _email = value!,
                      ),
                      const SizedBox(height: SpacingSize.s12),
                      TextFormField(
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: textTheme.bodyLarge,
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            icon: (!_showPassword)
                                ? const Icon(
                                    Icons.visibility_outlined,
                                  )
                                : const Icon(
                                    Icons.visibility_off_outlined,
                                  ),
                          ),
                        ),
                        validator: (value) {
                          return (value != null)
                              ? validatePassword(value)
                              : validatePassword("");
                        },
                        onSaved: (value) => _password = value!,
                        onFieldSubmitted: (_) => _login(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SpacingSize.s20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _login();
                    },
                    child: const Text("Login"),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
