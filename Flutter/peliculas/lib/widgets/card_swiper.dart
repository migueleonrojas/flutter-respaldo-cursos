import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/models/models.dart';



class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({
    super.key, 
    required this.movies
  });
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(movies.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index ) {

          final movie = movies[index];

          movie.heroId = 'swiper-${ movie.id }';//se crea una id para el tag de la animacion
          

          return  GestureDetector(//detectar los gestos, en este caso en la imagen que este en el frente
            onTap: () => Navigator.pushNamed(context, 'details', arguments:movie),
            child: Hero(//widget para agregar una animacion
              tag: movie.heroId!,//es un identificador, no pueden estar 2 Hero con el mismo tag
              child: ClipRRect(//para colocar bordes redondos
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,//adaptar el tamano de la imagen al tamano del contenedor padre
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}