import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:provider/provider.dart';
import 'package:peliculas/providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  //el placeholder en el cuadro de busqueda, se puede indicar aqui sobreescribiendo el que viene por defecto
  @override
  String get searchFieldLabel => 'Buscar peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {

    return[
      IconButton(
        icon: Icon( Icons.clear),
        onPressed: () => query = '',

      )
    ];

    /* return[
      GestureDetector(
        onTap: () => query='',
        child: const Icon(Icons.close)
      )
    ]; */
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);//cuando se presiona el boton de la x, podran retornar un valor en donde se hace la instancia de este delegate, MovieSearchDelegate() = retornara un valor, en este caso retorna null, ya que esta instancia es una promesa
      },
    );    


    /* return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Icon(Icons.arrow_back)
    ); */
  }

  @override
  Widget buildResults(BuildContext context) {

    return Text('e');
   /*  if(query.isEmpty) return const Text('');

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return  Results(moviesProvider.onQueryMovies, () => moviesProvider.getAllMovies(query, true)); */

    
  }


  //metodo que regresa un widget
  Widget _emptyContainer() {
    return  Container(
      child: const Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130,),
      ),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {


    if(query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    moviesProvider.getSuggestionsByQuery(query);//se ejecuta el metodo que manda el valor al debouncer

    return StreamBuilder(//solo se va a redibujar cuando el Stream emita un valor
      stream: moviesProvider.suggestionStream,//colocando a la escucha el Stream
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if( !snapshot.hasData ) return _emptyContainer();
        
        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, int index)  => _MovieItem(movies[index])
        );
      },
    );

  }

}


class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,  
        ),
      ),
      title: Text (movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
    
  }
}















