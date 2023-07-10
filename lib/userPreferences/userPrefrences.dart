// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class UserPrefereces{
  String usuario='';
  String razon='';
  String idExpediente='';
  String codRamo='';
  String ejercicio='';
  String numReporte='';
  String tipoRiesgo='';
  String marca='';
  String tipo='';
  String modelo='';
  String placas='';
  String numSiniestro='';
  String claveTaller='';
  String numPoliza='';
  String consecutivo='';
  String idRiesgo='';
  String transito='';
  String  piso='';
  String idEstatusExpediente='';
  String carillExpres='';


  inicioSecion(usuario, razon)async{
   // ignore: no_leading_underscores_for_local_identifiers
   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
       SharedPreferences prefs = await _prefs;
       prefs.setBool('sesion', true);
       prefs.setString('user',usuario);
       prefs.setString('razonSocial', razon);
  }

 cerrarSecion(context)async{
// ignore: no_leading_underscores_for_local_identifiers
final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
       SharedPreferences prefs = await _prefs;
       prefs.setBool('sesion', false);
       prefs.setString('user','');
       prefs.setString('razonSocial', '');
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyApp()));
 }


registroEncontrado(idExpediente, codRamo, ejercicio, numReporte, tipoRiesgo, marca, tipo, modelo, placas, numSiniestro, claveTaller, numPoliza, consecutivo, idRiesgo, transito, piso, idEstatusExpediente, carrilExpres)async{
       // ignore: no_leading_underscores_for_local_identifiers
       final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
       SharedPreferences prefs = await _prefs;
         prefs.setString('idExpediente', idExpediente);
         prefs.setString('codRamo',codRamo);
         prefs.setString('ejercicio', ejercicio);
         prefs.setString('numReporte', numReporte);
         prefs.setString('tipoRiesgo', tipoRiesgo);
         prefs.setString('marca', marca);
         prefs.setString('tipo', tipo);
         prefs.setString('modelo', modelo);
         prefs.setString('placas', placas);
         prefs.setString('numSiniestro', numSiniestro);
         prefs.setString('claveTaller', claveTaller);
         prefs.setString('numPoliza', numPoliza);
         prefs.setString('consecutivo', consecutivo);
         prefs.setString('idRiesgo', idRiesgo);
         prefs.setString('transito', transito);
         prefs.setString('piso', piso);
         prefs.setString('idEstatusExpediente', idEstatusExpediente);
         prefs.setString('carrilExpres', carrilExpres);         

 }
}