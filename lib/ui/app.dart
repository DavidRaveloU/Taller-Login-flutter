import 'package:flutter/material.dart';
import 'pages/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const IniciarUsuario(),
      debugShowCheckedModeBanner: false,
    );
  }
}
