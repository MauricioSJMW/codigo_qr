// ignore_for_file: file_names, deprecated_member_use

import 'package:codigo_qr/main.dart';
import 'package:flutter/material.dart';

import 'LocalString/localString.dart';

class SinConexion extends StatelessWidget {
   const SinConexion({Key? key}) : super(key: key);
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

    // ignore: avoid_print
    print("initState Called");
  }

  
  TextEditingController email = TextEditingController();
  // ignore: prefer_final_fields, unused_field
  String _barcode = "";
  TextEditingController password = TextEditingController();
    LocaleString tr =  LocaleString();
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(tr.sinCon),
          backgroundColor: Colors.purple,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 50, right: 50),
            child: Center(
              child: Column(children: [
                const SizedBox(height: 15),
                const SizedBox(height: 100),
                const SizedBox(height: 5),
                // ImageIcon( AssetImage('assets/qualitas.png'), size:100)
                const Image(
                  image: AssetImage('assets/iconohelp.png'),
                  height: 190,
                ),
                const SizedBox(height: 10),
                 Text(tr.noCon,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                    Text(tr.favVer,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ), textAlign:TextAlign.center),
                    const SizedBox(height: 20,),
                    RaisedButton(
                  disabledColor: Colors.amber,
                  // ignore: sort_child_properties_last
                  child:  Text(
                    tr.aceptar,
                    style:  const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                  splashColor: Colors.amber,
                  color: Colors.purple,
                  onPressed: () async{
                   Navigator.push(
          context, MaterialPageRoute(builder: (context) => const  MyApp()));
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }  
}
