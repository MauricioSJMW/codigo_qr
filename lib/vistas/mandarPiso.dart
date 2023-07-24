// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, file_names, prefer_interpolation_to_compose_strings, unused_element, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../LocalString/localString.dart';
import '../transitoPiso.dart';
import '../userPreferences/userPrefrences.dart';

// ignore: must_be_immutable
class MandarPiso extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  MandarPiso({
    Key? key,
    required this.datoss,
  });

  var datoss;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _login(
        datos2: datoss,
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class _login extends StatefulWidget {
  _login({
    Key? key,
    required this.datos2,
  });
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
    // // ignore: duplicate_ignore
    // setState(() {
    //   reporteCompleto = "${"Reporte: "+widget.datos2[0]['codRamo']+" "+widget.datos2[0]['ejercicio']+" "+widget.datos2[0]['numReporte']} "+widget.datos2[0]['idRiesgo'];
    //   unidadCompleta = "${"Unidad: "+widget.datos2[0]['marca']+" "+widget.datos2[0]['tipo']} "+widget.datos2[0]['modelo'];
    // });
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
        title: Text(tr.regPisos),
        backgroundColor: const Color.fromARGB(255, 237, 182, 247),
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Registro()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              const Image(
                image: AssetImage('assets/iconopalomita.png'),
                height: 190,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tr.capFecha,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  TextButton(
                    // ignore: sort_child_properties_last
                    style: TextButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text(
                      'Si',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registro()));
                    },
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  TextButton(
                    // ignore: sort_child_properties_last
                    style: TextButton.styleFrom(backgroundColor: Colors.purple),
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      UserPrefereces cerrar = UserPrefereces();
                      cerrar.cerrarSecion(context);
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
