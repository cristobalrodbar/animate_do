import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FadeIn(
              delay: Duration(milliseconds: 500), child: Text('Animate_do')),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TwitterPage(),
                      ));
                },
                icon: FaIcon(FontAwesomeIcons.twitter)),
            SlideInLeft(
              from: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Pagina1Page(),
                        ));
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowRight)),
            )
          ],
        ),
        floatingActionButton: ElasticInRight(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavegacionPage(),
                  ));
            },
            child: FaIcon(FontAwesomeIcons.play),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElasticIn(
                delay: Duration(milliseconds: 1100),
                child: Icon(
                  Icons.new_releases,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
              FadeInDown(
                delay: Duration(milliseconds: 200),
                child: Text(
                  'Título',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
                ),
              ),
              FadeInDown(
                delay: Duration(milliseconds: 1800),
                child: Text(
                  'Adipisicing non nostrud',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
              ),
              FadeInLeft(
                delay: Duration(milliseconds: 1100),
                child: Container(
                  width: 220,
                  height: 2,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }
}
