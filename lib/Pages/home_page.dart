import 'package:flutter/material.dart';

import '../Entity/Lists.dart';
import '../book_design.dart';
import '../book_detail.dart';
import '../bottom_bar.dart';
import 'catergories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                const SizedBox(height: 15),
                // Başlık
                buildHead(),
                // Butonlar
                Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 20, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTopButton(
                            text: "Kategoriler",
                            icon: Icons.menu,
                            widget: const CategoriesPage(),
                            context: context),
                        topButton(
                            text: "favorites", icon: Icons.star_border),
                        topButton(
                            text: "Gifts", icon: Icons.card_giftcard),
                        topButton(
                            text: "Çok Satanlar",
                            icon: Icons.people,)
                            
                      ],
                    )),
                const SizedBox(height: 20),
                // Sales
                // tittle
                const Text("Öne Çıkanlar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black)),
                const SizedBox(
                  height: 12,
                ),

                Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: (200 / 290),
                      children: oneCikanlar()
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
                const SizedBox(height: 25),
              ]),
            ),
            //Alt Bar
            bottomBar(page: "home", context: context),
          ],
        ),
      ),
    );
  }

  Widget buildTopButton({
    required String text,
    required IconData icon,
    required Widget widget, //??
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 19.0, vertical: 22.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 247, 228, 169),
            ),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 40, 3, 253),
              size: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 40, 3, 253), fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget topButton({
    required String text,
    required IconData icon,
  }) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 19.0, vertical: 22.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 247, 228, 169),
            ),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 40, 3, 253),
              size: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 40, 3, 253), fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget buildHead() {
    return const Text(
      "Kitapcım",
      style: TextStyle(
        fontSize: 32,
        color: Color.fromARGB(255, 0, 0, 0),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildBook(
      {required String cost,
      required String bookName,
      required String photoUrl,
      required double screenWidth}) {
    return Container(
      height: 200,
      width: (screenWidth - 60) / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: const Color.fromARGB(255, 247, 228, 169)),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12.0,
          left: 12,
          top: 12,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resim
            Center(
                child: Image.asset(
              photoUrl,
              width: 125,
              height: 165,
            )),
            const SizedBox(
              height: 5,
            ),
            // Book Name Container
            Container(
              padding: const EdgeInsets.only(top: 1),
              child: Center(
                child: Text(
                  bookName,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            // Cost
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: Center(
                child: Text(
                  cost + "₺",
                  style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
