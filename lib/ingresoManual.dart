// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, file_names

import 'package:codigo_qr/LocalString/localString.dart';
import 'package:codigo_qr/transitoPiso.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controladores/ingresoManualControlador.dart';

class IngresoManual extends StatelessWidget {
  const IngresoManual({Key? key}) : super(key: key);

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
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    setState(() {
      idExpediente = prefs.getString('idExpediente')!;
      codRamo = prefs.getString('codRamo')!;
      ejercicios = prefs.getString('ejercicio')!;
      numReporte = prefs.getString('numReporte')!;
      idRiesgo = prefs.getString('idRiesgo')!;
      marca = prefs.getString('marca')!;
      tipo = prefs.getString('tipo')!;
      modelo = prefs.getString('modelo')!;
      razonSocial = prefs.getString('razonSocial')!;
      piso = prefs.getString('piso')!;
      transito = prefs.getString('transito')!;
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
         leading: IconButton(
          onPressed: ()async {
            Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Registro()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
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
                   Text(
                    tr.actualFecha,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    disabledColor: Colors.amber,
                    // ignore: sort_child_properties_last
                    child: Text(
                      tr.regTransito,
                      style: const TextStyle(color: Colors.white),
                    ),
                    splashColor: Colors.amber,
                    color: Colors.purple,
                    onPressed: () {
                      IngresoManualControlador transito =  IngresoManualControlador();
                      transito.adjudicar(idExpediente, "1", piso, context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    disabledColor: Colors.amber,
                    // ignore: sort_child_properties_last
                    child: Text(
                     tr.regPiso,
                      style: const TextStyle(color: Colors.white),
                    ),
                    splashColor: Colors.amber,
                    color: Colors.purple,
                    onPressed: () {
                      IngresoManualControlador transito =  IngresoManualControlador();
                      transito.adjudicar(idExpediente, transito, "1", context);
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
