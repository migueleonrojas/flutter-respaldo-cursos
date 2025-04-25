import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // final moviesProvider = Provider.of(context);provider generico
    // final moviesProvider = Provider.of<MoviesProvider>(context); provider de tipo MoviesProvider
    // se va al arbol de widgets y que traiga la primera instancia que encuentre sobre MoviesProvider, si no la encuentra, se crea una nueva instancia, siempre y cuando este definido en el main, en el MultiProvider()
    //listen: true => parametro para redibujar el widget HomeScreen() si alguna propiedad del provider se modifica, por defecto ya esta en true
    final moviesProvider =  Provider.of<MoviesProvider>(context);//parece que crea otra instancia

    //print(moviesProvider.onDisplayMovies);//se ejecuta dos veces, uno cuando esta vacio la propiedad, y la otra cuando ya obtiene los datos de la peticion

    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Peliculas en cine')
        ),
        elevation: 0,
        actions: [
          IconButton(
            //para realizar la busqueda, showSearch: metodo global que es accesible en toda la aplicacion ,delegate: clase o widget que requiere de ciertas condiciones
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            // tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies,),

            // slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),

          // Listado horizontal de peliculas

          ],
        ),
      )
    );
  }
}