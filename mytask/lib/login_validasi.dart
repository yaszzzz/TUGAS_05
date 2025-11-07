import 'package:flutter/material.dart';

class LoginValidasiPage extends StatefulWidget {
  const LoginValidasiPage({super.key});

  @override
  State<LoginValidasiPage> createState() => _LoginValidasiPageState();
}

class _LoginValidasiPageState extends State<LoginValidasiPage> {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final _key = GlobalKey<FormState>();

  login() {
    _key.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Validasi!')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: emailC,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gmail tidak boleh kosong';
                  } else if (!value.contains('@')) {
                    return 'format salah, harus ada @';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  login();
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
