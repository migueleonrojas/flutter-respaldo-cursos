import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';


class MoviesProvider extends ChangeNotifier{//se extiende de "ChangeNotifier" para que se convierta esta clase en un provider

  String _apiKey = 'd9fb15c4aa0b70f50e8a3395ad5e5d84';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> searchedMovies = [];
  List<String> querys = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;
 

  //instanciando el debouncer
  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500 ),
  );
  
  //creamos nuestro streamcontroller, es como un future
  //broadcast: para poder permitir que varios objetos puedan estar suscritos a los cambios de este Stream
  final StreamController<List<Movie>> _suggestionStreamControler = StreamController.broadcast();

  //metodo get que devuelve un Stream
  Stream<List<Movie>> get suggestionStream => _suggestionStreamControler.stream;

  bool isLoading = false;


  MoviesProvider(){
    print('movies provider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
    
  }

  /* [int page = 1] => para que sea opcional este parametro, va ser igual a 1 si no se manda este parametro */
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {

    final url = Uri.https(_baseUrl, endpoint,{
      'api_key': _apiKey,
      'language': _language,
      'page':'$page'
    });

    //realizando la peticion
    final response = await http.get(url);
    return response.body;

  }
  
  getOnDisplayMovies() async {
  
    /* //contruyendo la ruta a consultar
    var url = Uri.https(_baseUrl, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'page':'1'
    });

    //realizando la peticion
    final response = await http.get(url); */

    final jsonData = await _getJsonData('3/movie/now_playing');//optimizando codigo repetitivo

    final nowPlayingResponde = NowPlayingResponse.fromJson(jsonData);
    /* final nowPlayingResponde = NowPlayingResponse.fromJson(response.body); *///este metodo es = json.decode(response.body)
    //final Map<String, dynamic> decodedData = json.decode(response.body);//transformar de string a un map, en la variable indicar que tipo de valor va a recibir
    //print(nowPlayingResponde.results[0].title);//ya puedo ver las propiedades de la respuesta
    onDisplayMovies = nowPlayingResponde.results;
    // le avisa a todos los widgets que estan a la escucha de las propiedades de esta clase, que la data cambio y que se redibujen con la nueva data
    notifyListeners();
  }

  getPopularMovies() async {
    /* var url = Uri.https(_baseUrl, '3/movie/popular',{
      'api_key': _apiKey,
      'language': _language,
      'page':'1'
    });

    //realizando la peticion
    final response = await http.get(url); */

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);//optimizando codigo repetitivo

    final popularResponse = PopularResponse.fromJson(jsonData);

    /* final popularResponse = PopularResponse.fromJson(response.body); */
    //es como un sumador de elementos de un array, para ir acumulando los elementos de todas las peticiones que se vayan a realizar
    popularMovies = [...popularMovies, ...popularResponse.results];
    
    notifyListeners();
  }

  //el async convierte a esta funcion en un Future

  Future<List<Cast>> getMovieCast(int movieId) async {

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits', _popularPage);

    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }




  Future<List<Movie>> searchMovies(String query) async {

    querys = [...querys, query];

    if(querys.length >= 2){

      if(querys[querys.length - 2] == query){
        return searchedMovies;
      }

    }


    final url = Uri.https(_baseUrl, '3/search/movie',{
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);

    final searchResponse = SearchResponse.fromJson(response.body);

    searchedMovies = searchResponse.results;

    

    return searchedMovies;

  }


  void getSuggestionsByQuery(String searchTerm) {

    debouncer.value = '';

    //metodo que se manda a llamar cuando se pase las 500 milesimas de segundo
    debouncer.onValue = (value) async {

      //print('Tenemos valor a buscar: $value');
      final results = await searchMovies(value);

      _suggestionStreamControler.add(results);//indicarle a Stream que hay nuevo valor

    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());

  }


  

  /* getAllMovies([String query = '', bool acum = false]) async {


    if(acum) _moviesPage++;

    if(isLoading) return onQueryMovies;

    isLoading = true;
    
    final jsonData = await _getJsonData('3/search/movie', _moviesPage, query);

    final moviesResponse = MoviesResponse.fromJson(jsonData);

    acum
      ? onQueryMovies = [ ...onQueryMovies, ...moviesResponse.results]
      : onQueryMovies = [...moviesResponse.results];
    
    
    isLoading = false;
    print(onQueryMovies.length);
    print(acum);
    notifyListeners();

  } */

  /* void setMoviesPage(int value) {
    _moviesPage = value;
  }

  void setQuerysMovies() {
    onQueryMovies = [];
  }
 */
}

