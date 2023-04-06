import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/pagina1_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animate_do',
        home:
            //NavegacionPage()
            Pagina1Page()
        //TwitterPage()
        //Pagina1Page()
        );
  }
}
