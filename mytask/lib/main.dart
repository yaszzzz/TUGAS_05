import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'tugas5.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Storage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 156, 168, 255)),
        useMaterial3: true,
      ),
      home: const PendaftaranPage(),
    );
  }
}
