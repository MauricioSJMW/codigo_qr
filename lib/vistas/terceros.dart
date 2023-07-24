// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:codigo_qr/vistas/estatusErr18.dart';
import 'package:flutter/material.dart';

import '../ingresoManual.dart';
import '../userPreferences/userPrefrences.dart';
import 'estatusError.dart';
import 'mandarPiso.dart';
import 'mandarTransito.dart';
// ignore: unused_import
import 'rechazado.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Register({
    Key? key,
    required this.datoss,
  });

  // ignore: prefer_typing_uninitialized_variables
  var datoss;
  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var dat = widget.datoss;
    // to use state class values you need to use the widget as the parent class object
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expedientes"),
        backgroundColor: const Color.fromARGB(255, 237, 182, 247),
      ),
      body: ListView.builder(
          itemCount: widget.datoss.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    print(dat[index]);
                    print('llllll');
                    UserPrefereces registro = UserPrefereces();
                    registro.registroEncontrado(
                        dat[index]['idExpediente'].toString(),
                        dat[index]['codRamo'],
                        dat[index]['ejercicio'],
                        dat[index]['numReporte'],
                        dat[index]['tipoRiesgo'],
                        dat[index]['marca'],
                        dat[index]['tipo'],
                        dat[index]['modelo'],
                        dat[index]['placas'],
                        dat[index]['numSiniestro'],
                        dat[index]['claveTaller'],
                        dat[index]['numPoliza'],
                        dat[index]['consecutivo'],
                        dat[index]['idRiesgo'],
                        dat[index]['transito'].toString(),
                        dat[index]['piso'].toString(),
                        dat[index]['idEstatusExpediente'],
                        dat[index]['carrilExpres']);

                    if (dat[index]['idEstatusExpediente'] == '03' ||
                        dat[index]['idEstatusExpediente'] == '05' ||
                        dat[index]['idEstatusExpediente'] == '06' ||
                        dat[index]['idEstatusExpediente'] == '07' ||
                        dat[index]['idEstatusExpediente'] == '09' ||
                        dat[index]['idEstatusExpediente'] == '13' ||
                        dat[index]['idEstatusExpediente'] == '16' ||
                        dat[index]['idEstatusExpediente'] == '25' ||
                        dat[index]['idEstatusExpediente'] == '26' ||
                        dat[index]['idEstatusExpediente'] == '28') {
                      //aca va
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EstatusError()));
                    }
                    if (dat[index]['idEstatusExpediente'] == '18' ||
                        dat[index]['idEstatusExpediente'] == '19' ||
                        dat[index]['idEstatusExpediente'] == '20') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EstatusError18()));
                    }
                    if (dat[index]['piso'].toString() == '1' ||
                        dat[index]['transito'].toString() == '1' &&
                            dat[index]['piso'].toString() == '1') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MandarPiso(
                                    datoss: widget.datoss,
                                  )));
                    }
                    if (dat[index]['transito'].toString() == '0' &&
                        dat[index]['piso'].toString() == '0') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IngresoManual(
                                    datoss: widget.datoss,
                                  )));
                    }
                    if (dat[index]['transito'].toString() == '1' &&
                        dat[index]['piso'].toString() == '0') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MandarTransito(
                                    datoss: widget.datoss,
                                  )));
                    }
                  },
                  child: Container(
                    color: Colors.cyanAccent[700],
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                        title: Text(
                      "${"REPORTE: " + dat[index]['codRamo'] + " " + dat[index]['ejercicio'] + " " + dat[index]['numReporte'] + " " + dat[index]['tipoRiesgo']} " +
                          dat[index]['marca'],
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
    );
  }
}
