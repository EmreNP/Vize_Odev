import "package:flutter/material.dart";
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userName;
  String? password;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Kullanıcı Adı",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "kullanici adi giriniz";
                  }
                  return null;
                },
                onSaved: (value) {
                  userName = value;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: "Şifre",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Şifre giriniz";
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: const Text("Şifremi Unuttum"),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 145.0),
                  _LoginButton(context)
                ],
              ),
              const SizedBox(height: 225),
              MaterialButton(
                child: const Text("Üye Ol"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _LoginButton(BuildContext context) => ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          if (userName == "admin" && password == "admin") {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("Hata"),
                    content: Text("Kullanıcı adı veya şifreniz hatalı"),
                  );
                });
          }
        }
      },
      child: const Text("Giriş Yap"));
}
