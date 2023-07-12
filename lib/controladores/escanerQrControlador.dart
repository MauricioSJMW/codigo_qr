

// ignore_for_file: file_names

import 'dart:convert';

import 'package:codigo_qr/vistas/readjudicar.dart';
import 'package:flutter/material.dart';

import '../ingresoManual.dart';
import '../peticiones/peticiones.dart';
import '../vistas/terceros.dart';

class EscanerQrControlador{

  busquedaManual(ejercicio, reporte, afectado, usuario, context)async{
final msg = jsonEncode({
      "numReporte": reporte,
      "tiporiesgo": afectado,
      "ejercicio": ejercicio,
      "claveTaller": usuario
    });
   Peticiones login = Peticiones();
   
     var datos =await login.peticion(msg, 'busquedamanualexpediente', context);
     var  datoss = json.decode(datos);
      if (datos == '' ||
        datos == '[]') {
//displayAlert(context);
    } else {
      print('lllllllllllllllllllll');
      print(datoss.length);
      if(datoss.length==1){
  //UserPrefereces registro =  UserPrefereces();
      // registro.registroEncontrado(
      //     datoss[0]['idExpediente'].toString(),
      //     datoss[0]['codRamo'],
      //     datoss[0]['ejercicio'],
      //     datoss[0]['numReporte'],
      //     datoss[0]['tipoRiesgo'],
      //     datoss[0]['marca'],
      //     datoss[0]['tipo'],
      //     datoss[0]['modelo'],
      //     datoss[0]['placas'],
      //     datoss[0]['numSiniestro'],
      //     datoss[0]['claveTaller'],
      //     datoss[0]['numPoliza'],
      //     datoss[0]['consecutivo'],
      //     datoss[0]['idRiesgo'],
      //     datoss[0]['transito'].toString(),
      //     datoss[0]['piso'].toString(),s
      //     datoss[0]['idEstatusExpediente'],
      //     datoss[0]['carrilExpres']);
          if(datoss[0]['transito'].toString()=='1' || datoss[0]['piso'].toString()=='1'){
              Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Readjudicar(datoss: datoss,)));
          }else{
            print(datoss[0]);
             Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  IngresoManual(datoss: datoss,)));
          }      }else{
 print('lllllllll');
     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Register(datoss: datoss,),
  ),);
      
      }
    }
  }


    busquedaQr(reporte, usuario, context)async{
final msg = jsonEncode({reporte});
   Peticiones login = Peticiones();
   
     var datos =await login.peticion(msg, 'busquedamanualexpediente', context);
     var  datoss = json.decode(datos);
      if (datos == '' ||
        datos == '[]') {
//displayAlert(context);
    }else{
      if(datoss.length==0){
        if(datoss[0]['transito'].toString()=='1' || datoss[0]['piso'].toString()=='1'){
              Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Readjudicar(datoss: datoss,)));
          }else{
            print(datoss[0]);
             Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  IngresoManual(datoss: datoss,)));
          }   
      }else{
 print('lllllllll');
     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Register(datoss: datoss,),
  ),);
      
      }
      // UserPrefereces registro =  UserPrefereces();
      // registro.registroEncontrado(
      //     datoss[0]['idExpediente'].toString(),
      //     datoss[0]['codRamo'],
      //     datoss[0]['ejercicio'],
      //     datoss[0]['numReporte'],
      //     datoss[0]['tipoRiesgo'],
      //     datoss[0]['marca'],
      //     datoss[0]['tipo'],
      //     datoss[0]['modelo'],
      //     datoss[0]['placas'],
      //     datoss[0]['numSiniestro'],
      //     datoss[0]['claveTaller'],
      //     datoss[0]['numPoliza'],
      //     datoss[0]['consecutivo'],
      //     datoss[0]['idRiesgo'],
      //     datoss[0]['transito'].toString(),
      //     datoss[0]['piso'].toString(),
      //     datoss[0]['idEstatusExpediente'],
      //     datoss[0]['carrilExpres']);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) =>  IngresoManual(datoss: datoss,)));
    } 
    }
}