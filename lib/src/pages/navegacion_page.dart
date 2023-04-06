import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('notifications page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            label: 'Notification',
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: BounceInDown(
                      from: 10,
                      animate: (numero > 0) ? true : false,
                      child: Bounce(
                        from: 10,
                        controller: (controller) =>
                            Provider.of<_NotificationModel>(context)
                                .bounceController = controller,
                        child: Container(
                          child: Text(
                            '$numero',
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                        ),
                      ),
                    ) /*  Icon(
                    Icons.brightness_1,
                    size: 8,
                    color: Colors.redAccent,
                  ), */
                    )
              ],
            )
            //FaIcon(FontAwesomeIcons.bell)
            ),
        BottomNavigationBarItem(
            label: 'My dog', icon: FaIcon(FontAwesomeIcons.dog))
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationModel>(context, listen: false);

        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;
        if (numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController controller) {
    _bounceController = controller;
    notifyListeners();
  }
}
