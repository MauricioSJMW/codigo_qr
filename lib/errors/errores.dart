import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';

class Errores {
  loginError(context) {
    EmojiAlert(
      alertTitle: const Text(
        "Usuario o contraseña incorrectos.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      description: const Column(
        children: [
          Text(
            "Verifica tus datos.",
            style: TextStyle(fontSize: 19),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      enableMainButton: true,
      mainButtonColor: Colors.purple,
      onMainButtonPressed: () {
        Navigator.pop(context);
      },
      cancelable: false,
      emojiType: EMOJI_TYPE.CONFUSED,
      height: 300,
    ).displayAlert(context);
  }

  errorReporte(context) {}

  Future<void> showAlertDialog2(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text('Usuario o contraseña incorrectos'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Verfica tus datos.',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar',
                  style: TextStyle(fontWeight: FontWeight.w800)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
