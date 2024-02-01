import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? eposta;
  String? sifre;

  void _getUserInfoDevice() async {
    final prefs = await SharedPreferences.getInstance();
    eposta = prefs.getString("eposta");
    sifre = prefs.getString("sifre");
    setState(() {});
  }

  @override
  void initState() {
    _getUserInfoDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Prefences"),
      ),
      body: Center(
        child: Text("Hoşgeldin eposta: $eposta sifre: $sifre"),
      ),
    );
  }
}
