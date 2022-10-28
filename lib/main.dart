import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:uccdax/pantallas/pagina1.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then(
    (value) {
      runApp(MiApp());
    },
  );
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UCC DAX",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final particleOptions = ParticleOptions(
      baseColor: Color.fromARGB(255, 7, 135, 167),
      spawnOpacity: 0.0,
      opacityChangeRate: 0.25,
      minOpacity: 0.1,
      maxOpacity: 0.2,
      spawnMinSpeed: 30.0,
      spawnMaxSpeed: 70.0,
      spawnMinRadius: 50.0,
      spawnMaxRadius: 80.0,
      particleCount: 6,
    );
    return Scaffold(
        body: Container(
            child: Center(
      child: Stack(
        children: [cuerpo(), Boton(context)],
      ),
    )));
  }
}

Widget cuerpo() {
  return Container(
    child: Center(
        child: Stack(
      children: [
        Logo(),
        ola(),
      ],
    )),
  );
}

Widget Logo() {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 400),
    child: Center(
      child: Image.network(
          "https://i.ibb.co/LNtrMjg/H0-E7ey1-removebg-preview.png"),
    ),
  );
}

Widget Boton(context) {
  return Container(
    child: Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 22, 167, 203)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Text("INICIAR",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}

Widget ola() {
  return Container(
    child: WaveWidget(
      //user Stack() widget to overlap content and waves
      config: CustomConfig(
        colors: [
          Color.fromARGB(255, 13, 120, 155).withOpacity(0.5),
          Color.fromARGB(255, 10, 147, 181).withOpacity(0.3),
          Color.fromARGB(255, 28, 73, 179).withOpacity(0.4),
          //the more colors here, the more wave will be
        ],
        durations: [20000, 20000, 20000],
        //durations of animations for each colors,
        // make numbers equal to numbers of colors
        heightPercentages: [0.49, 0.53, 0.57],
        //height percentage for each colors.
        blur: MaskFilter.blur(BlurStyle.solid, 0),
        //blur intensity for waves
      ),
      waveAmplitude: 10.00, //depth of curves
      waveFrequency: 3, //number of curves in waves
      //background colors
      size: Size(
        double.infinity,
        double.infinity,
      ),
    ),
  );
}
