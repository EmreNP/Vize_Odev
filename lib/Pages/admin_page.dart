import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({ Key? key }) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Bu Uygulama \n Selçuk Üniversitesi \n  Teknoloki Fakültesi \n Bilgisayar Mühendisliği Bölümünde \n Dr. Ahmet Cevahir Çınar Rehberliğinde yapılmıştır")
    );
  }
}