import 'package:Vize/bottom_bar.dart';
import 'package:flutter/material.dart';
import '../Entity/Lists.dart';
import '../book_design.dart';
import '../book_detail.dart';
import '../header.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  String title;
  CategoryPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // başlık
              header(title, context),
              const SizedBox(height: 20),
              // içerikler

              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: (200 / 290),
                    children: books()
                        .map((book) => Column(children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return BookDetail(book);
                                  }));
                                },
                                child: bookDesign(
                                    title: book.name,
                                    image: book.image,
                                    tag: book.tag,
                                    cost: book.cost),
                              )
                            ]))
                        .toList()),
              ),
            ],
          )),
   bottomBar(page: "search", context: context)
    ])
    ));
  }
}
