// ignore_for_file: file_names

import 'dart:convert';

//import 'package:codigo_qr/vistas/readjudicar.dart';
import 'package:flutter/material.dart';

import '../ingresoManual.dart';
import '../peticiones/peticiones.dart';
import '../vistas/estatusErr18.dart';
import '../vistas/estatusError.dart';
import '../vistas/mandarPiso.dart';
import '../vistas/mandarTransito.dart';
// ignore: unused_import
import '../vistas/rechazado.dart';
import '../vistas/terceros.dart';

class EscanerQrControlador {
  busquedaManual(ejercicio, reporte, afectado, usuario, context) async {
    final msg = jsonEncode({
      "numReporte": reporte,
      "tiporiesgo": afectado,
      "ejercicio": ejercicio,
      "claveTaller": usuario
    });
    Peticiones login = Peticiones();

    var datos = await login.peticion(msg, 'busquedamanualexpediente', context);
    var datoss = json.decode(datos);
    if (datos == '' || datos == '[]') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const EstatusError()));
//displayAlert(context);
    } else {
      // print('lllllllllllllllllllll');
      // print(datoss.length);
      if (datoss.length == 1) {
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
        if (datoss[0]['idEstatusExpediente'] == '03' ||
            datoss[0]['idEstatusExpediente'] == '05' ||
            datoss[0]['idEstatusExpediente'] == '06' ||
            datoss[0]['idEstatusExpediente'] == '07' ||
            datoss[0]['idEstatusExpediente'] == '09' ||
            datoss[0]['idEstatusExpediente'] == '13' ||
            datoss[0]['idEstatusExpediente'] == '16' ||
            datoss[0]['idEstatusExpediente'] == '25' ||
            datoss[0]['idEstatusExpediente'] == '26' ||
            datoss[0]['idEstatusExpediente'] == '28') {
          //aca va
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Rechazado()));
        }
        if (datoss[0]['idEstatusExpediente'] == '18' ||
            datoss[0]['idEstatusExpediente'] == '19' ||
            datoss[0]['idEstatusExpediente'] == '20') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EstatusError18()));
        }
        if (datoss[0]['piso'].toString() == '1' ||
            datoss[0]['transito'].toString() == '1' &&
                datoss[0]['piso'].toString() == '1') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MandarPiso(
                        datoss: datoss,
                      )));
        }
        if (datoss[0]['transito'].toString() == '0' &&
            datoss[0]['piso'].toString() == '0') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IngresoManual(
                        datoss: datoss,
                      )));
        }
        if (datoss[0]['transito'].toString() == '1' &&
            datoss[0]['piso'].toString() == '0') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MandarTransito(
                        datoss: datoss,
                      )));
        }
      } else {
        // print('lllllllll');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Register(
              datoss: datoss,
            ),
          ),
        );
      }
    }
  }

  busquedaQr(reporte, usuario, context) async {
    print(reporte);
    final msg = jsonEncode({reporte});
    Peticiones login = Peticiones();

    var datos = await login.peticion(msg, 'buscarporconsecutivo', context);
    // ignore: unused_local_variable
    var datoss = json.decode(datos);
    print('uuuuu');
    print(datos);
  }
}
