import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:  [
          const ListTile(
            leading: Icon(
              Icons.photo,
              color: AppTheme.primary,
            ),
            title: Text('Soy un titulo'),
            subtitle: Text(
                'Duis nisi amet culpa reprehenderit incididunt irure irure Lorem.'),
          ),
          Padding(//se envolvio el row, para que los children del Row tengan una separacion
            padding: const EdgeInsets.only(right: 5),
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
                TextButton(
                  onPressed: () {},
                  //accediendo a los estilos que se pueden cambiar del TextButtom
                  /* style: TextButton.styleFrom(foregroundColor: Colors.teal), */
                  child: const Text('Cancel'),

                ),
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Ok'),
                

                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
