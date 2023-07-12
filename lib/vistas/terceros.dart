// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import '../ingresoManual.dart';
import '../userPreferences/userPrefrences.dart';
import 'readjudicar.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Register({Key? key, required this.datoss,});

  // ignore: prefer_typing_uninitialized_variables
   var datoss;
  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    var dat=widget.datoss;
    // to use state class values you need to use the widget as the parent class object
   return Scaffold(
      appBar: AppBar(title: const Text("Expedientes"), backgroundColor: Colors.purple,),
      body: ListView.builder(
          itemCount: widget.datoss.length,
          
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                
                 const SizedBox(height: 10,),
                GestureDetector(

                  onTap: (){
                    print(dat[index]);
                    print('llllll');
                     UserPrefereces registro =  UserPrefereces();
                     registro.registroEncontrado(dat[index]['idExpediente'].toString(), dat[index]['codRamo'], dat[index]['ejercicio'], dat[index]['numReporte'], dat[index]['tipoRiesgo'], dat[index]['marca'], dat[index]['tipo'], dat[index]['modelo'], dat[index]['placas'], dat[index]['numSiniestro'], dat[index]['claveTaller'], dat[index]['numPoliza'], dat[index]['consecutivo'], dat[index]['idRiesgo'], dat[index]['transito'].toString(), dat[index]['piso'].toString(),dat[index]['idEstatusExpediente'], dat[index]['carrilExpres']);
                     if(dat[index]['transito'].toString()=='1' || dat[index]['piso'].toString()=='1'){
              Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  Readjudicar(datoss: widget.datoss)));
          }else{
             Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  IngresoManual(datoss: widget.datoss,)));
          } 
                  },
                  child: Container(
                  color: Colors.cyanAccent[700],
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                        title: Text("${"REPORTE: "+dat[index]['codRamo']+" "+dat[index]['ejercicio']+" "+dat[index]['numReporte']+" "+dat[index]['tipoRiesgo']} "+dat[index]['marca'], style: const TextStyle(color: Colors.white),)),
                  ),
                ),
                 const  SizedBox(height: 10,),

              ],
            );
          }),
    );
  }
}

