// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import '../peticiones/peticiones.dart';
import '../transitoPiso.dart';

class IngresoManualControlador {
  adjudicar(idExpediente, transito, piso, context) async {
    int bandera1 = 0;
    int bandera2 = 0;
    if (transito == '1') {
      bandera1 = 1;
    }
    if (piso == '1') {
      bandera2 = 1;
    }
    final msg = jsonEncode(
        {"idExpediente": idExpediente, "transito": bandera1, "piso": bandera2});
    Peticiones login = Peticiones();

    var datos = await login.peticion(msg, 'adjudicar', context);
    var datoss = json.decode(datos);
    // print('jjjjjjjj');
    // print(datoss);
    if (bandera1 == 1) {
      if (datoss['transito'] == 1) {
        _showAlertDialog(context, 'Se adjudico con exito en transito');
      }
    }
    if (bandera2 == 1) {
      if (datoss['transito'] == 0) {
        _showAlertDialog(context, 'Se adjudico con exito en piso');
      }
    }
  }

  Future<void> _showAlertDialog(context, titulo) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: Text(titulo),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Desea adjudicar un nuevo vehiculo?',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No',
                  style: TextStyle(fontWeight: FontWeight.w800)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Si',
                  style: TextStyle(fontWeight: FontWeight.w800)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Registro()));
              },
            ),
          ],
        );
      },
    );
  }
}
