import 'dart:io';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => exit(0),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: const Center(
            child: Text('Home'),
          ),
        ));
  }
}
