import 'package:flutter/material.dart';

Widget header(String title, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    children: [
    const SizedBox(height: 15),

    //geri iconu
    GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 27,
      ),
    ),
    const SizedBox(
      height: 15,
    ),
    //başlık
    Text(
      title,
      style: const TextStyle(fontSize: 30, color: Colors.black),
    ),
    const SizedBox(
      height: 16,
    ),
  ]);
}
