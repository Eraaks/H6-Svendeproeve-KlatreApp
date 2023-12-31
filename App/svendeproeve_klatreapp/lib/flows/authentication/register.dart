import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:svendeproeve_klatreapp/global/constants.dart';
import 'package:svendeproeve_klatreapp/services/auth.dart';

class SignUpPage extends StatelessWidget {
  final Function toggleView;
  const SignUpPage({Key? key, required this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        backgroundColor: mainBackgroundColor,
        appBar: AppBar(
          backgroundColor: topBackgroundColor,
          elevation: 0.0,
          title: const Text('Sign Up for Climb-IT'),
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Sign In'),
              onPressed: () {
                toggleView();
              },
              style: TextButton.styleFrom(
                foregroundColor: mainBackgroundColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
              child: isSmallScreen
                  ? const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _Logo(),
                        SignUpPageContent(),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.all(32.0),
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: const Row(
                        children: [
                          Expanded(child: _Logo()),
                          Expanded(
                            child: Center(child: SignUpPageContent()),
                          ),
                        ],
                      ),
                    )),
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/ic_launcher.png'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Register for Climb-IT!",
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class SignUpPageContent extends StatefulWidget {
  const SignUpPageContent({Key? key}) : super(key: key);

  @override
  State<SignUpPageContent> createState() => _SignUpPageContentState();
}

class _SignUpPageContentState extends State<SignUpPageContent> {
  bool _isPasswordVisible = false;
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  String email = '';
  String password = '';
  String username = '';
  String moderatorCode = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300, maxHeight: 600),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Please enter a valid email';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.supervised_user_circle),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            _gap(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Moderator Code',
                hintText: 'Enter a Moderator Code if you have one',
                prefixIcon: Icon(Icons.accessibility_new_outlined),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  moderatorCode = value;
                });
              },
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: topBackgroundColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (username != '') {
                      await storage.write(key: 'Username', value: username);
                    }
                    if (moderatorCode == '') {
                      await storage.write(key: 'ModeratorCode', value: 'Empty');
                    } else {
                      await storage.write(
                          key: 'ModeratorCode', value: moderatorCode);
                    }

                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);

                    if (result == null) {
                      setState(() {
                        error = 'Please supply a valid email';
                      });
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
