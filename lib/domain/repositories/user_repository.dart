import 'package:login/domain/entities/users.dart';

class UserRepository {
  verificarUsuarioLogin(var usuario, var nombre, var contrasena) {
    final List<User> listaUsuarios = usuarioCreado;
    for (var user in listaUsuarios) {
      if (user.usuario == usuario &&
          user.nombre == nombre &&
          user.contrasena == contrasena) {
        return true;
      }
    }
    return false;
  }

  verificarUsuarioRegister(var usuario, var contrasena, var nombre) {
    final List<User> listaUsuarios = usuarioCreado;
    for (var user in listaUsuarios) {
      if (user.usuario == usuario &&
          user.contrasena == contrasena &&
          user.nombre == nombre) {
        return true;
      }
    }
    return false;
  }
}
