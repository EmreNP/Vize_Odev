import 'package:Vize/Pages/admin_page.dart';
import 'package:Vize/Pages/cart.dart';
import 'package:Vize/Pages/catergories_page.dart';
import 'package:Vize/Pages/home_page.dart';
import 'package:flutter/material.dart';

Widget bottomBar({required String page, required context}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: const Color.fromARGB(255, 206, 203, 205),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        buildBottonIcon(
            context: context,
            active: page == "home",
            iconData: Icons.home_filled,
            widget: const HomePage()),
        buildBottonIcon(
            context: context,
            active: page == "search",
            iconData: Icons.search,
            widget: const CategoriesPage()),
        buildBottonIcon(
            context: context,
            active: page == "cart",
            iconData: Icons.shopping_cart_outlined,
            widget: const Cart()),
        buildBottonIcon(
            context: context,
            active: page == "profile",
            iconData: Icons.person,
            widget: const AdminPage()),
      ]),
    ),
  );
}

buildBottonIcon(
    {context,
    required bool active,
    required IconData iconData,
    required Widget widget}) {
  return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget;
        }));
      },
      child:
          Icon(iconData, size: 22, color: active ? Colors.blue : Colors.black));
}
