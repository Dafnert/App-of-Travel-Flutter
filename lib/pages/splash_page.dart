import 'package:actividad3_flutter/routing/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //Después de 5 segundos pasará al login
    Future.delayed(const Duration(seconds: 5),() {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 50.0),
          //Imagen
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png',
            width: 250,
            height: 250,
          ),
          const SizedBox(height: 50.0),
          const SizedBox(
            child: Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50.0),
          const Center(
            child: Text(
              "Cada viaje es una historia por escribir.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 100, 16, 152),
                  fontFamily: 'Roboto'),
            ),
          ),
        ],
      ),
    )));
  }
}
