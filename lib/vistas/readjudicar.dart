// ignore_for_file: deprecated_member_use, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LocalString/localString.dart';
import '../ingresoManual.dart';

// ignore: must_be_immutable
class Readjudicar extends StatelessWidget {
// ignore: use_key_in_widget_constructors
Readjudicar({Key? key, required this.datoss,});

  // ignore: prefer_typing_uninitialized_variables
   var datoss;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  _login(datos2: datoss,),
    );
  }
}

// ignore: camel_case_types
class _login extends StatefulWidget {
   _login({Key? key, required this.datos2,});
  var datos2;

  @override
  _loginState createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<_login> {
  String codRamo = '';
  String ejercicios = '';
  String numReporte = '';
  String idRiesgo = '';
  String marca = '';
  String tipo = '';
  String modelo = '';
  String reporteCompleto = '';
  String unidadCompleta = '';
  String razonSocial = '';
  String piso = '';
  String transito = '';
  String idExpediente = '';
  @override
  // ignore: must_call_super
  void initState() {
    datosTaller();
  }

  datosTaller() async {

    setState(() {

      reporteCompleto = "${"Reporte: "+widget.datos2[0]['codRamo']+" "+widget.datos2[0]['ejercicio']+" "+widget.datos2[0]['numReporte']} "+widget.datos2[0]['idRiesgo'];
      unidadCompleta = "${"Unidad: "+widget.datos2[0]['marca']+" "+widget.datos2[0]['tipo']} "+widget.datos2[0]['modelo'];
    });
  }

  TextEditingController ejercicio = TextEditingController();
  TextEditingController numeroReporte = TextEditingController();
  bool bandera1 = false;
  bool bandera2 = false;
  LocaleString tr = LocaleString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(tr.ingreso),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(razonSocial,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    color: Colors.cyanAccent[700],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        reporteCompleto,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.cyanAccent[700],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        unidadCompleta,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.cyanAccent[700],
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        tr.vin,
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    disabledColor: Colors.amber,
                    // ignore: sort_child_properties_last
                    child: Text(
                     tr.read,
                      style: const TextStyle(color: Colors.white),
                    ),
                    splashColor: Colors.amber,
                    color: Colors.purple,
                    onPressed: () {
                     Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  IngresoManual(datoss: widget.datos2,)));
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
