import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';

import '../screens/screens.dart';

class AppRoutes {
  //propiedad o metodo estatico = es una propiedad o un metodo que se puede acceder sin la necesidad de instanciar la clase
  //se puediera ver como si se quisiera colocar algo de manera global
  static const initialRoute = 'home';

  //haciendo las rutas pero con un modelo
  static final menuOptions = <MenuOption>[
    //TODO: borrar home
    /* MenuOption(
        route: 'home',
        name: 'Home Screen',
        screen: const HomeScreen(),
        icon: Icons.home
    ), */
    MenuOption( route: 'listview1', name: 'Listview tipo 1',    screen: const ListView1Screen(), icon: Icons.list_alt),
    MenuOption( route: 'listview2', name: 'Listview tipo 2',    screen: const ListView2Screen(), icon: Icons.list),
    MenuOption( route: 'alert',     name: 'Alertas - Alerts',   screen: const AlertScreen(),     icon: Icons.add_alert_rounded),
    MenuOption( route: 'card',      name: 'Tarjetas - Cards',   screen: const CardScreen(),      icon: Icons.credit_card),
    MenuOption( route: 'avatar',    name: 'Circle Avatar',      screen: const AvatarScreen(),    icon: Icons.supervised_user_circle_outlined),
    MenuOption( route: 'animated',  name: 'Animated Container', screen: const AnimatedScreen(),  icon: Icons.play_circle_outline_rounded),
    MenuOption( route: 'inputs',    name: 'Text Inputs',        screen: const InputsScreen(),    icon: Icons.input_rounded),
    MenuOption( route: 'slider',    name: 'Slider and Checks',  screen: const SliderScreen(),    icon: Icons.slow_motion_video_rounded),
    MenuOption( route: 'listviewbuilder',    name: 'Infinite Scroll & Pull to refresh',  screen: const ListViewBuilderScreen(),    icon: Icons.build_circle_outlined),


  ];

  //creando un metodo que contendra las rutas de la aplicacion
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    //se crea un mapa vacio
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    //se recorre la lista de modelos
    for (final option in menuOptions) {
      //se va llenando nuestro mapa, recorriendo el listado de modelos, donde se
      //asignan el string que seria la ruta, regresar una funcion que contruye el widget que es la que se muestra con esta ruta
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  //colocando todas las rutas definidas como propiedad estatica
  /*  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listview1': (BuildContext context) => const ListView1Screen(),
    'listview2': (BuildContext context) => const ListView2Screen(),
    'alert': (BuildContext context) => const AlertScreen(),
    'card': (BuildContext context) => const CardScreen()
  }; */

  //tambien colocando un metodo estatico
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //imprime la ruta que se esta intentando navegar pero no esta definida, se va a generar
    print(settings);

    //retornas la ruta con el widget al cual se va a dirigir
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
