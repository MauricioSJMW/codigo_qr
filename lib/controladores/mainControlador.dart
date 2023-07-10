// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../errors/errores.dart';
import '../peticiones/peticiones.dart';
import '../transitoPiso.dart';
import '../userPreferences/userPrefrences.dart';

class MainControlador{
  mandarPeticion(context, usuario, contrasena)async{
  final msg = jsonEncode({"usuario": usuario, "contrasena": contrasena});
   
   Peticiones login = Peticiones();
   
    var datos =await login.peticion(msg, 'login', context);
  var  datoss = json.decode(datos);
    if (datoss['usuario'] == "err") {
      Errores errorLogin = Errores();
      errorLogin.loginError(context);
    } else {
      UserPrefereces user =  UserPrefereces();
      user.inicioSecion(datoss['usuario'], datoss['razonSocial']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Registro()));
    }
  }
}