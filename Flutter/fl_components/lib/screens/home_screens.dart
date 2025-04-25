import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Componentes en Flutter')),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(AppRoutes.menuOptions[index]
                      .name), //usando la propiedad estatica del Approutes
                  leading: Icon(
                    AppRoutes.menuOptions[index].icon,
                    color: AppTheme.primary,
                  ), //usando la propiedad estatica del Approutes
                  onTap: () {
                    /* 1 era OPCION PARA HACER LA NAVEGACION, mas que todo se usa cuando no hay rutas definidas en el main */
                    /* //especificando el widget que contendra la ruta
                    final route = MaterialPageRoute(
                        builder: (context) => const ListView1Screen());

                    //context es como una memoria de como esta construida nuestra aplicacion

                    //dirigiendose al widget que contiene la ruta, la cual se especifico anteriormente
                    Navigator.push(context, route); */

                    /* 2 da OPCION PARA HACER LA NAVEGACION, mas que todo cuando estan las rutas definidas en el main, pero no siempre es asi */
                    /* //se indica solamente el nombre de la ruta que se especifo en el main.dart
                    Navigator.pushNamed(context,
                        'card2'); //esta ruta no existe en las que estan definidas, se tomara como una ruta dinamica, la cual se generara en el main, en la propiedad "onGenerateRoute" aqui es donde se genera */

                    Navigator.pushNamed(
                        context,
                        AppRoutes.menuOptions[index]
                            .route); //usando la propiedad estatica del Approutes
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions
                .length)); //usando la propiedad estatica del Approutes
  }
}
