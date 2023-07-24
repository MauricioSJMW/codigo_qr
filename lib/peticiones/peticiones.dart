// ignore_for_file: unused_import

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
class Peticiones {
  String url = 'http://207.248.252.225/wsPortalQMovil/apirest/servicios/';
  Future<String>peticion(msg, url3, context)async{
    var url2 = url+url3;
    Map<String, String> headers = {'Content-Type': 'application/json'};

    http.Response respuesta = await http.post(
      Uri.parse(url2),
      headers: headers,
      body: msg,
    );
    return respuesta.body;
  }
}