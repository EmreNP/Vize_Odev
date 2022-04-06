import 'dart:ffi';

import 'package:Vize/Entity/Lists.dart';
import 'package:flutter/material.dart';

import '../Entity/Book.dart';
import '../bottom_bar.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  static double Result = 0;

  @override
  Widget build(BuildContext context) {
    Result = 0;
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                children:
                    cartlist().map((Book book) => addingBook(book)).toList(),
              ),
            ),
            Container(
              height: 75,
              width: 500,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 89, 218, 211),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 24,
                    )
                  ]),
              child: Column(children: [
                const Text(
                  "Satın Al",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "(Toplam ${Result.toString()}₺)",
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 8, 8, 8)),
                )
              ]),
            ),
            const SizedBox(height: 70),
          ])),
      bottomBar(page: "cart", context: context),
    ])));
  }

  Widget addingBook(Book book) {
    Result += book.cost;
    return Container(
      height: 100,
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(book.image),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Text(
                book.name,
                style: const TextStyle(color: Colors.red),
              ),
              Text(book.authorName),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(book.cost.toString() + "₺"),
        GestureDetector(
          onTap: () => removeCartList(book),
          child :Row(
            children: [const Icon(Icons.close)],
          ),
        )
      ]),
    );
  }
}
