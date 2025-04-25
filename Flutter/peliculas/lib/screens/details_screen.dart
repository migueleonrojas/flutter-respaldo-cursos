import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class  DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

  //TODO: cambiar luego por una instancia de movie
  /* final Movie movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'; *///se obtiene el valor del parametro que se le esta pasando cuando se redirecciona a esta pantalla
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie ;
    
    return  Scaffold(
      
      body: CustomScrollView(//para hacer scroll, y hacer el uso de los slivers
        physics: const BouncingScrollPhysics(),
        slivers: [//widgets que tienen cierto comportamiento pre programado, cuando se hace scroll en el contenido del padre
          _CustomAppBar(movie:movie),
          SliverList(//aqui van los widgets normales, para que no genere un error, ya que estamos en la propiedad slivers en el cual solo debe contener sliver, pero este SliverList realiza una excepcion
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie:movie),
              _Overview(movie:movie),
              CastingCards(movieId: movie.id)
            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;
  const _CustomAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,//para que nunca desaparezca
      flexibleSpace: FlexibleSpaceBar(//aplica una animacion cuando el appbar esta subiendo y comprimiendose
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background:  FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
          
        ),
      ),


    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;
  const _PosterAndTitle({
    required this.movie
  });
  
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top:20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(//para agregar animaciones
            tag: movie.heroId!,//deben haber 2 widget hero con el mismo id, pero que esten en diferentes pantallas, para realizar la transicion
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                /* width: 110, */
              ),
            ),
          ),
          const SizedBox(width: 20,),
          ConstrainedBox(//contenedor que se le puede manipular su tamano y sus hijos tambien se adaptaran
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),//headline5: tamano del texto
                Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.green,),
                    const SizedBox(width: 5,),
                    Text(movie.voteAverage.toString(), style: textTheme.caption,)
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;
  const _Overview({
    required this.movie
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}