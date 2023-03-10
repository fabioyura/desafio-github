import 'package:app/helpers/helpers.dart';
import 'package:app/helpers/injection.dart';
import 'package:app/src/pages/repository_page.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupProviders();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeTs();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desafio GitHub',
        theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.black87)),
        home: const RepositoryPage());
  }
}
