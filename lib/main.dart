import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const LoginDemo(),
      )),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginState();
}

class _LoginState extends State<LoginDemo> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          Stack(
            children: [
              _buildEditText('Input username', username, true, true),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: _buildBottomDivider()),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          Row(
            children: [
              Expanded(
                  child: _buildEditText(
                      'Input password', password, isVisiblePassword, false)),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.green, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isVisiblePassword = !isVisiblePassword;
                    });
                  },
                  icon: const Icon(
                    Icons.hide_source_rounded,
                    size: 26.0,
                  ))
            ],
          ),
          _buildBottomDivider(),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.green, backgroundColor: Colors.green),
              onPressed: () {
                print('username: ${username.text}');
                print('password: ${password.text}');
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildEditText(String hint, TextEditingController controller,
      bool isVisible, bool isAutoFocus) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 10.0),
      child: TextFormField(
        autofocus: isAutoFocus,
        keyboardType: TextInputType.text,
        obscureText: !isVisible,
        controller: controller,
        decoration: InputDecoration.collapsed(hintText: hint),
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
      ),
    );
  }

  Widget _buildBottomDivider() {
    return const Divider(
      height: 1.0,
      color: Colors.grey,
      thickness: 1,
    );
  }
}
