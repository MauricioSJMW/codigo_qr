// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, unused_import, file_names

import 'dart:convert';

import 'package:codigo_qr/transitoPiso.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'LocalString/localString.dart';
import 'conexion/conexion.dart';

class IngresoQr extends StatelessWidget {
  const IngresoQr({Key? key}) : super(key: key);

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
  @override
  // ignore: must_call_super
  initState() {
    traerDatos();

    // ignore: avoid_print
    print("initState Called");
  }

  traerDatos() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    final String? action = prefs.getString('user');
    setState(() {
      usuario = action!;
    });
  }

  String usuario = '';
  TextEditingController ejercicio = TextEditingController();
  TextEditingController numeroReporte = TextEditingController();
  LocaleString tr = LocaleString();
  bool bandera1 = false;
  bool bandera2 = false;
  final _claveFormulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.ingresoManual),
        backgroundColor: const Color.fromARGB(255, 237, 182, 247),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Registro()));
          },
          icon: const Icon(Icons.back_hand),
        ),
      ),
      body: Form(
        key: _claveFormulario,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 50, right: 50),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(tr.ejercicio,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.cyanAccent[700],
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa ejercicio';
                  }
                  return null;
                },
                controller: ejercicio,
                maxLength: 2,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.cyanAccent[700],
                ),
                decoration: InputDecoration(
                  hintText: tr.a,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(tr.reporte,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.cyanAccent[700],
                      fontWeight: FontWeight.w800,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingresa el numero de reporte';
                  }
                  return null;
                },
                controller: numeroReporte,
                keyboardType: TextInputType.number,
                maxLength: 7,
                decoration: InputDecoration(
                  hintText: tr.numero,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  tr.afectado,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.cyanAccent[700],
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              CheckboxListTile(
                title: const Text('A'),
                value: bandera1,
                onChanged: (bool? value) {
                  setState(() {
                    bandera1 = value!;
                    bandera2 = false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('T', style: TextStyle(fontSize: 20)),
                value: bandera2,
                onChanged: (bool? value) {
                  setState(() {
                    bandera2 = value!;
                    bandera1 = false;
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                // ignore: sort_child_properties_last
                child: Text(
                  tr.buscar,
                  style: const TextStyle(color: Colors.white),
                ),

                onPressed: () {
                  if (!_claveFormulario.currentState!.validate()) {
                    return;
                  } else {
                    peticionBusquedaManual(ejercicio, numeroReporte, context);
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  peticionBusquedaManual(ejercicio, reporte, context) async {
    int valor = int.parse(ejercicio.text);
    // print('//////////');
    // print(valor);
    if (valor <= 23) {
      String tipo = '';
      if (bandera1 == false) {
        tipo = 'T';
      } else {
        tipo = 'A';
      }
      Conexion con = Conexion();
      // ignore: unused_local_variable
      var valor = con.verificarConexionBusqueda(
          ejercicio.text, reporte.text, tipo, usuario, context);
      // EscanerQrControlador _buscarReporte = new EscanerQrControlador();
      // _buscarReporte.busquedaManual(
      //     ejercicio.text, reporte.text, tipo, usuario, context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("El ejercicio debe ser menor a 23"),
        backgroundColor: Colors.purple,
        elevation: 10,
      )); // newMethod();
    }
  }

  void showToast(
    String msg,
  ) {
    Toast.show(
      msg,
      duration: 10,
    );
  }
}
