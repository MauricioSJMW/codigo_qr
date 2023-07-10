// ignore_for_file: file_names

import 'package:codigo_qr/escanerQr.dart';
import 'package:codigo_qr/userPreferences/userPrefrences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LocalString/localString.dart';
import 'controladores/home.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);
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
  late String titulo = '';
  @override
  // ignore: must_call_super
  initState() {
    datosTaller();

    // ignore: avoid_print
    print("initState Called");
  }

  datosTaller() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    final String? action = prefs.getString('razonSocial');

    setState(() {
      titulo = action!;
    });
  }

  TextEditingController email = TextEditingController();
  // ignore: prefer_final_fields, unused_field
  String _barcode = "";
  TextEditingController password = TextEditingController();
    LocaleString tr =  LocaleString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(tr.tipRegis),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: ()async {
            UserPrefereces cerrar = UserPrefereces();
            cerrar.cerrarSecion(context);
          },
          icon: const Icon(Icons.door_front_door_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
               Text(
                tr.ingreUnidad,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
               Text(
                tr.escanerQr,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              // ImageIcon( AssetImage('assets/qualitas.png'), size:100)
              GestureDetector(
                child: const Image(
                  image: AssetImage('assets/lecqr.png'),
                  height: 190,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
              const SizedBox(height: 10),
               Text(tr.regManual,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  )),
              GestureDetector(
                child: const Image(
                  image: AssetImage('assets/ingresomanual.png'),
                  height: 190,
                ),
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IngresoQr()));
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }  
}
