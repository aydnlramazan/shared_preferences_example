import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/home_page.dart'; // Ekleme satırı

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _epostaController = TextEditingController();

  final _sifreController = TextEditingController();

  void _savedUsedToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("eposta", _epostaController.text);
    prefs.setString("sifre", _sifreController.text);
  }

/*
  void _chechUserFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final String? eposta = prefs.getString("eposta");
    final String? sifre = prefs.getString("sifre");
    if (eposta != null && sifre != null) {
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _epostaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Eposta"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _sifreController,
                decoration: InputDecoration(
                  labelText: "Şifre",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _savedUsedToDevice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: const Text("Giriş yap"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
