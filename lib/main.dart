import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas7/themeprovider.dart';
import 'package:tugas7/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
      builder: (context, temaProvider, child) {
        return MaterialApp(
          title: 'Tugas Shared Preferences',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: temaProvider.tema,
          debugShowCheckedModeBanner: false,
          home: const Homepage(),
        );
      },
    );
  }
}
