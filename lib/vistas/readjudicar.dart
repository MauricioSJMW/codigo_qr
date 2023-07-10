// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LocalString/localString.dart';
import '../ingresoManual.dart';

class Readjudicar extends StatelessWidget {
  const Readjudicar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _login(),
    );
  }
}

// ignore: camel_case_types
class _login extends StatefulWidget {
  const _login({Key? key}) : super(key: key);
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
    final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    SharedPreferences prefs2 = await prefs;
    setState(() {
      idExpediente = prefs2.getString('idExpediente')!;
      codRamo = prefs2.getString('codRamo')!;
      ejercicios = prefs2.getString('ejercicio')!;
      numReporte = prefs2.getString('numReporte')!;
      idRiesgo = prefs2.getString('idRiesgo')!;
      marca = prefs2.getString('marca')!;
      tipo = prefs2.getString('tipo')!;
      modelo = prefs2.getString('modelo')!;
      razonSocial = prefs2.getString('razonSocial')!;
      piso = prefs2.getString('piso')!;
      transito = prefs2.getString('transito')!;
      reporteCompleto = "Reporte:$codRamo $ejercicios $numReporte $idRiesgo";
      unidadCompleta = "Unidad: $marca $tipo $modelo";
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
                    MaterialPageRoute(builder: (context) => const IngresoManual()));
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
