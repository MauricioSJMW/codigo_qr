// ignore_for_file: use_build_context_synchronously, unnecessary_import, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ingresoManual.dart';
import '../vistas/estatusError.dart';
import '../vistas/mandarPiso.dart';
import '../vistas/mandarTransito.dart';
import '../vistas/rechazado.dart';
import '../vistas/terceros.dart';
import 'escanerQrControlador.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 182, 247),
      ),
      body: const QrScan(),
    );
  }
}

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String usuario = '';
  int bandera = 1;
  @override
  void initState() {
    traerDatos();
    super.initState();
    controller?.resumeCamera();
  }

  traerDatos() async {
    final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    SharedPreferences prefs2 = await prefs;
    final String? action = prefs2.getString('user');
    setState(() {
      usuario = action!;
    });
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderRadius: 10, borderWidth: 5, borderColor: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? mandarPeticion()
                  : const Text('Escanenado codigo'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
    if (result == null) {
    } else {
      EscanerQrControlador esca = EscanerQrControlador();
      esca.busquedaQr(result?.code, usuario, context);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  mandarPeticion() async {
    String url =
        'http://207.248.252.225/wsPortalQMovil/apirest/servicios/buscarporconsecutivo';
    if (result == null) {
      print('No pasa nada aun');
    } else {
      if (bandera == 1) {
        print('lllllllllllllllll');
        Map<String, String> headers = {'Content-Type': 'application/json'};

        // ignore: unused_local_variable
        http.Response respuesta = await http.post(
          Uri.parse(url),
          headers: headers,
          body: result?.code,
        );
        print(respuesta.body);
        // ignore: unused_local_variable
        var datoss = json.decode(respuesta.body);
        if (respuesta.body == '' || respuesta.body == '[]') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EstatusError()));
        } else {
          if (datoss.length == 1) {
            //UserPrefereces registro =  UserPrefereces();
            // registro.registroEncontrado(
            //     datoss[0]['idExpediente'].toString(),
            //     datoss[0]['codRamo'],
            //     datoss[0]['ejercicio'],
            //     datoss[0]['numReporte'],
            //     datoss[0]['tipoRiesgo'],
            //     datoss[0]['marca'],
            //     datoss[0]['tipo'],
            //     datoss[0]['modelo'],
            //     datoss[0]['placas'],
            //     datoss[0]['numSiniestro'],
            //     datoss[0]['claveTaller'],
            //     datoss[0]['numPoliza'],
            //     datoss[0]['consecutivo'],
            //     datoss[0]['idRiesgo'],
            //     datoss[0]['transito'].toString(),
            //     datoss[0]['piso'].toString(),s
            //     datoss[0]['idEstatusExpediente'],
            //     datoss[0]['carrilExpres']);
            if (datoss[0]['idEstatusExpediente'] == '03' ||
                datoss[0]['idEstatusExpediente'] == '05' ||
                datoss[0]['idEstatusExpediente'] == '06' ||
                datoss[0]['idEstatusExpediente'] == '07' ||
                datoss[0]['idEstatusExpediente'] == '09' ||
                datoss[0]['idEstatusExpediente'] == '16' ||
                datoss[0]['idEstatusExpediente'] == '25' ||
                datoss[0]['idEstatusExpediente'] == '26' ||
                datoss[0]['idEstatusExpediente'] == '28') {
              //aca va
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Rechazado()));
            }
            if (datoss[0]['idEstatusExpediente'] == '13' ||
                datoss[0]['idEstatusExpediente'] == '18' ||
                datoss[0]['idEstatusExpediente'] == '19' ||
                datoss[0]['idEstatusExpediente'] == '20') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EstatusError()));
            }
            if (datoss[0]['piso'].toString() == '1' ||
                datoss[0]['transito'].toString() == '1' &&
                    datoss[0]['piso'].toString() == '1') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MandarPiso(
                            datoss: datoss,
                          )));
            }
            if (datoss[0]['transito'].toString() == '0' &&
                datoss[0]['piso'].toString() == '0') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IngresoManual(
                            datoss: datoss,
                          )));
            }
            if (datoss[0]['transito'].toString() == '1' &&
                datoss[0]['piso'].toString() == '0') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MandarTransito(
                            datoss: datoss,
                          )));
            }
          } else {
            // print('lllllllll');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(
                  datoss: datoss,
                ),
              ),
            );
          }
        }

        bandera++;
      }
    }
  }
}
