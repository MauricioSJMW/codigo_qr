// ignore_for_file: sort_child_properties_last, unused_local_variable, deprecated_member_use, camel_case_types, unused_import

import 'dart:convert';
import 'package:codigo_qr/transitoPiso.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LocalString/localString.dart';
import 'conexion/conexion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const _login(),
    );
  }
}

class _login extends StatefulWidget {
  const _login({Key? key}) : super(key: key);
  @override
  _loginState createState() => _loginState();
   
}

class _loginState extends State<_login> {
   @override
    // ignore: must_call_super
    initState(){
      verificarSecion();
    }
    verificarSecion()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? sesion = prefs.getBool('sesion');
    setState(() {
       if (sesion == true) {
        mostrarPrincipal = true;
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Registro()));
      } else {
        mostrarPrincipal = false;
           
      }
     // print(mostrarPrincipal);
    });
    
    }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool mostrarPrincipal = false;
  String usurio = '';
  String contrasena = '';
  String taller = '';
  LocaleString tr =  LocaleString();
    late Locale language= const Locale('es', 'MX');

        final _claveFormulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(tr.inicio),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Form(
          key: _claveFormulario,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('assets/logob.jpg'),
                  alignment: Alignment.topRight,
                  height: 100,
                ),
                const SizedBox(height: 120),
                TextFormField(
                  controller: email,
                   validator: (value) {
            if (value!.isEmpty) {
              return 'Ingresa codigo de usuario';
            }
            return null;
          },
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.cyanAccent[700],
                  ),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.purple)),
                    hintText: tr.user,
                    fillColor: Colors.black87,
                    hintStyle: TextStyle(
                      color: Colors.cyanAccent[700],
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                TextFormField(
                   validator: (value) {
            if (value!.isEmpty) {
              return 'Ingresa contraseña';
            }
            return null;
          },
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.purple,
                        ),
                      ),
                      hintText: tr.contra,
                      hintStyle:
                          TextStyle(color: Colors.cyanAccent[700], fontSize: 20)),
                ),
                const SizedBox(height: 70),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    disabledColor: Colors.amber,
                    child:  Text(
                      tr.ingr,
                      style:const  TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    splashColor: Colors.amber,
                    color: Colors.purple,
                    onPressed: () async{
                        if (!_claveFormulario.currentState!.validate()) {
                    return;
                  }else{
                       Conexion con = Conexion();
                     var valor= con.verificarConexion(context, email.text, password.text);
                  }
                   
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
