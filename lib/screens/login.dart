// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/screens.dart';
import '../utils/utils.dart';
import '../api/psssa_service.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  bool _showPassword = false;
  bool _isLoading = false;  // Loading state

  String? validateEmail(String username) {
    if (username.isEmpty) {
      return "Please enter your user name";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Please enter your password";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  void _login() async {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      setState(() {
        _isLoading = true;  // Show spinner
      });

      formState.save();
      await PsssaService().login(_username, _password).then((response) async {
        if (response.statusCode == 200) {
          final pref = await SharedPreferences.getInstance();
          final Map<String, dynamic> user = jsonDecode(pref.getString("user")!);
          if (user["account_type_id"] == 1) {
            Navigator.of(context)
                .pushReplacementNamed(AdminHomeScreen.routeName);
          } else {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Login Failed'),
              content: const Text('Invalid username or password'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }

        setState(() {
          _isLoading = false;  // Hide spinner
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    Size size = context.deviceSize;

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
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),  // Show spinner
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/psssa_logo.png",
                            width: 150,
                          ),
                        ],
                      ),
                      const SizedBox(height: SpacingSize.s20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PSSSA Postal Services",
                            style: textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: SpacingSize.s40),
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
                                labelText: 'User ID',
                                labelStyle: textTheme.bodyLarge,
                                border: const OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                return (value != null)
                                    ? validateEmail(value)
                                    : validateEmail("");
                              },
                              onSaved: (value) => _username = value!,
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
