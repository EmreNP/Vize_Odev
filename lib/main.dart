import 'package:Vize/Pages/cart.dart';
import 'package:Vize/book_detail.dart';
import 'package:Vize/Pages/catergories_page.dart';
import 'package:flutter/material.dart';

import 'Pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CategoriesPage(),
    );
  }
}
