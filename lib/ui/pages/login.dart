import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/ui/pages/listar.dart';
import 'package:login/ui/pages/register.dart';

import '../../domain/repositories/user_repository.dart';

class IniciarUsuario extends StatefulWidget {
  const IniciarUsuario({super.key});

  @override
  State<IniciarUsuario> createState() => _IniciarUsuarioState();
}

class _IniciarUsuarioState extends State<IniciarUsuario> {
  UserRepository userRepository = UserRepository();
  TextEditingController usuario = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController contrasena = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Iniciar sesión'),
          ),
        ),
        body: Column(
          children: [
            SvgPicture.asset('assets/images/login.svg'),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 50, 60, 20),
              child: TextField(
                controller: usuario,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
              child: TextField(
                controller: nombre,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: TextField(
                controller: contrasena,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
                  labelText: 'Contraseña',
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 50),
                ),
                const Text(
                  '¿Aún no tienes cuenta?',
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: InkWell(
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegistrarUsuario()));
                      },
                    )),
              ],
            ),
            MaterialButton(
              onPressed: () {
                if (validar() == true) {
                  if (userRepository.verificarUsuarioLogin(
                    usuario.text,
                    nombre.text,
                    contrasena.text,
                  )) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ListarMaterias()));
                  } else {
                    avanzar(context, 'Usuario no registrado', [139, 0, 0]);
                  }
                } else {
                  avanzar(context, 'Llene todos lo campos', [139, 0, 0]);
                }
              },
              color: Colors.deepPurple,
              minWidth: 200.0,
              height: 50.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  bool validar() {
    if (usuario.text.isEmpty ||
        contrasena.text.isEmpty ||
        nombre.text.isEmpty) {
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
