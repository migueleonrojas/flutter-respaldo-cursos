import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({
    super.key, 
    required this.imageUrl,
    this.name
    });

  final String imageUrl;
  final String? name;//parametro opcional

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, //sirve para cortar o adecuar el contenido
      shape: RoundedRectangleBorder(
          //para indicar como se quieren los bordes
          borderRadius: BorderRadius.circular(15)),
      elevation: 30,
      shadowColor:
          AppTheme.primary.withOpacity(0.6), //color de la sombra, con opacidad
      child: Column(
        children: [
          FadeInImage(
            //flutter maneja el cache con un "FadeInImage" y un "NetworkImage", para que se guarde la imagen y solo se cargue la primera vez que accedemos a este widget
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'), //imagen que se ve mientras se carga la imagen que viene de internet
            width: double.infinity, //funciona donde el width es limitado, toma el mayor ancho posible
            height: 230,
            fit: BoxFit.cover, //como la imagen se va adaptar a su widget
            fadeInDuration: const Duration(milliseconds: 300),
          ),

          if(name != null)//se puede colocar condicionales dentro del array o elemento de un array, si se cumple la condicion se construye el widget
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child:  Text(name ?? 'No Title'),//si name es nulo, entonces muestra lo que esta a la derecha
            )
        ],
      ),
    );
  }
}
