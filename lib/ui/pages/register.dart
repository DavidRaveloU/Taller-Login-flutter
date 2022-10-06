import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:login/domain/entities/users.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/user_repository.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({super.key});

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  UserRepository userRepository = UserRepository();
  TextEditingController usuario = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController confirmarContrasena = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Registrarse'),
          ),
        ),
        body: Column(
          children: [
            SvgPicture.asset('assets/images/signup.svg'),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              child: TextField(
                controller: usuario,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'usuario',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
              child: TextField(
                controller: nombre,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'nombre',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
              child: TextField(
                controller: contrasena,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 40),
              child: TextField(
                controller: confirmarContrasena,
                obscureText: !passwordVisible,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmar contraseña',
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                const ValueKey('btnUsuario');
                if (validarCampos()) {
                  if (userRepository.verificarUsuarioRegister(
                          nombre.text, usuario.text, contrasena.text) ==
                      false) {
                    setState(() {
                      usuarioCreado.add(User(
                          usuario: usuario.text,
                          nombre: nombre.text,
                          contrasena: contrasena.text));
                    });
                    avanzar(context, 'Usuario registrado correctamente',
                        [60, 179, 113]);
                  } else {
                    avanzar(context, 'El usuario ya existe', [139, 0, 0]);
                  }
                } else {
                  avanzar(context, 'Campo vacios o contraseña no coincidentes',
                      [139, 0, 0]);
                }
                Timer(Duration(seconds: 2), () {
                  print("Yeah, this line is printed immediately");
                });
              },
              color: Colors.deepPurple,
              minWidth: 200.0,
              height: 50.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Registrarse',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  bool validarCampos() {
    if (nombre.text.isEmpty ||
        contrasena.text.isEmpty ||
        confirmarContrasena.text.isEmpty ||
        contrasena.text != confirmarContrasena.text) {
      return false;
    }
    return true;
  }

  avanzar(BuildContext context, String mensaje, List<int> color) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Registro'),
              content: Text(
                mensaje,
                style: TextStyle(
                    color: Color.fromRGBO(color[0], color[1], color[2], 1)),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Aceptar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
