// ignore_for_file: file_names

import 'package:Vize/Pages/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Book.dart';

var categoriler = [
  "Tümü",
  "Roman",
  "Deneme",
  "Bilim",
  "Dergi",
  "Akademik",
  "Mühendislik",
  "Hikaye",
  "Polisiye",
  "Ders Kitapları",
  "Din",
  "Eğitim",
  "Sosyoloji-Felsefi"
];

var kitaplar = [
  Book(
      name: "Beyaz Zambaklar Ülkesinde",
      authorName: "Grigory Petrov",
      categoryName: "Roman",
      yayinevi: "Truva",
      cost: 14.25,
      tag: "Öne çıkanlar",
      pageNum: "128",
      image: "assets/images/birinciKitap.png"),
  Book(
      name: "Fareler ve İnsanlar",
      authorName: "John Steinback",
      categoryName: "Roman",
      yayinevi: "Sel",
      cost: 20,
      tag: "Öne çıkanlar",
      pageNum: "126",
      image: "assets/images/ikinciKitap.png"),
  Book(
      name: "Çalıkuşu",
      authorName: "Reşat Nuri Güntekin",
      categoryName: "Roman",
      yayinevi: "İnkılâp",
      cost: 30.5,
      tag: "",
      pageNum: "544",
      image: "assets/images/calikusu.jpg"),
  Book(
      name: "Üç Zor Mesele",
      authorName: "İsmet Özel",
      categoryName: "Deneme",
      yayinevi: "Tiyo",
      cost: 40,
      tag: "Çok Satanlar",
      pageNum: "599",
      image: "assets/images/uczormesele.jpg"),
  Book(
      name: "Erbain",
      authorName: "İsmet Özel",
      categoryName: "Deneme",
      yayinevi: "Tiyo",
      cost: 40,
      tag: "",
      pageNum: "250",
      image: "assets/images/erbain.jpg"),
  Book(
      name: "Bu ülke",
      authorName: "Cemil Meriç",
      categoryName: "Sosyoloji-Felsefi",
      yayinevi: "İletişi",
      cost: 25.5,
      tag: "Çok Satanlar",
      pageNum: "250",
      image: "assets/images/buulke.jpg"),
];

List<String> categories() {
  return categoriler;
}

List<Book> books() {
  return kitaplar;
}

List<Book> oneCikanlar() {
  final one = <Book>[];
  for (var book in kitaplar) {
    if (book.tag != "") {
      one.add(book);
    }
  }
  return one;
}

final booklar = <Book>[];
void addedCart(Book book) {
  booklar.add(book);
}

List<Book> cartlist() {
  return booklar;
}

void removeCartList(Book book) {
  booklar.remove(book);
}


