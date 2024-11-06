import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializando o Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trekking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
        ],
        background: Container(color: Colors.white),
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Versão Mobile - Mauá Trekking'),
              ),
              body: const Center(
                child: Text('Bem-vindo ao Trekking App - Versão Mobile!'),
              ),
            ); // Layout para mobile
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Versão Desktop - Mauá Trekking'),
              ),
              body: const Center(
                child: Text('Bem-vindo ao Trekking App - Versão Desktop!'),
              ),
            ); // Layout para desktop
          }
        },
      ),
    );
  }
}
