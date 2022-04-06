
import 'package:flutter/material.dart';

import '../Entity/Lists.dart';
import '../bottom_bar.dart';
import 'category.dart';
import '../header.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            header("Kategoriler", context),

              Expanded(
                child: ListView(
                  children: categories()      
                      .map((String title) => buildCategory(title,context))
                      .toList(),
                ),
              )
            ],
          ),
        ),
        bottomBar(page: "search",context: context),
      ]
      
    )));
  }

  Widget buildCategory(String title,BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryPage(title);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 7),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 4,
            )
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
