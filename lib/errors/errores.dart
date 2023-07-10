import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';

class Errores{
  loginError(context){
 EmojiAlert(
	alertTitle:const Text("Usuario o contraseña incorrectos.", style:  TextStyle(fontWeight:  FontWeight.bold, fontSize:20,),
   textAlign: TextAlign.center,
  ),
	description:  Column(
		children: const [
		 Text("Verifica tus datos.", style:TextStyle(fontSize:19), 
      textAlign: TextAlign.center,
     ),
		],
	),
	enableMainButton:  true,
	mainButtonColor:  Colors.purple,
	onMainButtonPressed: () {
		Navigator.pop(context);
	},
	cancelable:  false,
	emojiType:  EMOJI_TYPE.CONFUSED,
	height:  300,
).displayAlert(context);
  }
  errorReporte(context){

  }
}