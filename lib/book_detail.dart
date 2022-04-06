import 'package:Vize/Entity/Lists.dart';
import 'package:flutter/material.dart';

import 'Pages/cart.dart';
import 'Entity/Book.dart';
import 'bottom_bar.dart';
import 'header.dart';

// ignore: must_be_immutable
class BookDetail extends StatelessWidget {
  Book book;
  BookDetail(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // başlık
              header(book.name, context),
              const SizedBox(height: 20),
              Center(child: tag()),
              const SizedBox(
                height: 3,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView(children: [
                    // Resim
                    Image.asset(
                      book.image,
                      height: 320,
                      width: 240,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // özellikler
                    bookAttribute(text: "Author Name: " + book.authorName),
                    bookAttribute(text: "Türü: " + book.categoryName),
                    bookAttribute(text: "Sayfa Sayısı: " + book.pageNum),
                    bookAttribute(text: "Yayınevi: " + book.yayinevi),
                    // sepete ekle butonu
                    addToCart(context),
                    const SizedBox(
                      height: 70,
                    ),
                  ]),
                ),
              )
            ])),
        bottomBar(context:context,page: "search")
      ],
    )));
  }

  Widget bookAttribute({required String text}) {
    return Container(
        height: 40,
        width: 250,
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
        child: Center(child: Text(text)));
  }

  Widget addToCart(context) {
    return GestureDetector(
      onTap: () {
      addedCart(book);
      Navigator.pop(context); {
      };},
      child:Container(
          height: 40,
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 24,
                )
              ]),
          child: Center(
              child: Text(" Sepete Ekle (${book.cost}₺) ",
                  style: TextStyle(fontSize: 18)))),
    );
  }
  Widget tag() {
    return Container(
        height: 27,
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 199, 236, 243),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 24,
              )
            ]),
        child: Center(child: Text(book.tag,style: TextStyle(color: Color.fromARGB(255, 252, 133, 202),fontSize: 11))));
  }
}
