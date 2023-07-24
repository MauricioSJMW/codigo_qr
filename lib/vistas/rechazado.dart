// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../LocalString/localString.dart';
import '../transitoPiso.dart';

class Rechazado extends StatelessWidget {
  const Rechazado({Key? key}) : super(key: key);
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
  LocaleString tr = LocaleString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('!Error¡'),
        backgroundColor: const Color.fromARGB(255, 237, 182, 247),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Center(
            child: Column(children: [
              const SizedBox(height: 40),

              // ImageIcon( AssetImage('assets/qualitas.png'), size:100)
              const Image(
                image: AssetImage('assets/iconohelp.png'),
                height: 190,
              ),
              const SizedBox(height: 60),
              Text(
                tr.rechazado,
                maxLines: 3,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 40,
                width: 190,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registro()));
                    },
                    style: TextButton.styleFrom(backgroundColor: Colors.purple),
                    child: Text(
                      tr.aceptar,
                      style: const TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
