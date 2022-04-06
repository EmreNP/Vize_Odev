import 'package:flutter/material.dart';

Widget bookDesign({
  required String tag,
  required String image,
  required String title,
  required double cost,
}) {
  return Container(
      height: 255,
      width: 180,
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
      child: Column(children: [
        Text(tag,
            style: const TextStyle(
              color: Colors.orange,
            )),
        Image.asset(
          image,
          width: 125,
          height: 165,
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(cost.toString() + " ₺",
                style: const TextStyle(
                  color: Colors.blue,
                )),
          ],
        )
      ]));
}
