import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../controladores/escanerQrControlador.dart';
import '../controladores/mainControlador.dart';
import '../sinConexion.dart';

class Conexion{
  Future<String> verificarConexion(context, email, password)async{
bool result = await InternetConnectionChecker().hasConnection;
var valor='';
if(result == true) {
  MainControlador login =  MainControlador();
  login.mandarPeticion(context, email, password);
  valor='uno';
} else {
   Navigator.push(
    context, MaterialPageRoute(builder: (context) => const  SinConexion()));
 valor='dos';
}
return valor;
  }


  Future<String> verificarConexionBusqueda(ejercicio, reporte, tipo, usuario, context)async{
bool result = await InternetConnectionChecker().hasConnection;
var valor='';
if(result == true) {
    EscanerQrControlador buscarReporte =  EscanerQrControlador();
    buscarReporte.busquedaManual(
        ejercicio, reporte, tipo, usuario, context);
  valor='uno';
} else {
   Navigator.push(
    context, MaterialPageRoute(builder: (context) => const SinConexion()));
 valor='dos';
}
return valor;
  }
}