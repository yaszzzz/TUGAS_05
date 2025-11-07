import 'package:flutter/material.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({super.key});

  @override
  State<PendaftaranPage> createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  final userC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final nomorC = TextEditingController();
  final alamatC = TextEditingController();
  final _key = GlobalKey<FormState>();

  login() {
    _key.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pendaftaran Pengguna')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: userC,
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
                controller: emailC,
                decoration: InputDecoration(
                  labelText: 'email',
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
                controller: nomorC,
                decoration: InputDecoration(
                  labelText: 'nomor hp',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[0-9]+$').hasMatch(value) ||
                      value.length <= 10) {
                    return 'Nomor HP harus angka dan lebih dari 10 digit';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: alamatC,
                decoration: InputDecoration(
                  labelText: 'alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'alamat tidak boleh kosong';
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
                  if (value == null || value.length <= 3) {
                    return 'Password harus lebih dari 3 karakter';
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
