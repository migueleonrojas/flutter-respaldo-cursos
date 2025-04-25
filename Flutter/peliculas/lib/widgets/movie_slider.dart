import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  MovieSlider({
    super.key, 
    required this.movies,
    required this.onNextPage,
    this.title,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  //se ejcuta la primera vez que este widget es contruido es como un ngOnInit en angular
  @override
  void initState() {
    //primero se ejecuta el initState
    super.initState();

    //se coloca a la escucha esta variable para obtener todos los cambios que pueda sufrir un widget, dicho widget tiene esta variable asignada en su propiedad controller
    scrollController.addListener(() {
      
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }

    });

    //luego ejecutamos nuestro codigo

  }

  //cuando el widget va ser destruido, es como un ngOnDestroy en angular
  @override
  void dispose() {
    //primero se ejecuta nuestro codigo
    
    
    //luego se ejecuta el dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {  
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          if (widget.title != null)//se coloca widget para hacer referencia al widget que mantiene el estado
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 5),
          Expanded(//se coloca el expanded ya que sin este, se genera un error debido, a que el ListView define su ancho basado en el padre, pero no sabe que ancho debe de tener porque su padre es flexible, el Expanded es para asignarle todo el ancho restante del Column
            child: ListView.builder(
              controller: scrollController,//se va asociar una variable a la propiedad controller, dicha variable obtendra todos los cambios que sufra este widget, y la variable se colocara a la escucha para obtener todos esos cambios en tiempo real 
              scrollDirection: Axis.horizontal,//para indicar la direccion del scroll
              itemCount: widget.movies.length,
              itemBuilder: ( _, int index) {
                final movie = widget.movies[index];
                return _MoviePoster(movie:movie, heroId:'${widget.title}-$index-${widget.movies[index].id}');
              } /* _MoviePoster(movie:movies[index]) */
            ),
          )
        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;
  final String heroId;

  _MoviePoster({
    required this.movie,
    required this.heroId
  });
  
  @override
  Widget build(BuildContext context) {

    movie.heroId = heroId;
    
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children:  [
           GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
             child: Hero(
               tag: movie.heroId!,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20),
                 child:  FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
               ),
             ),
           ),
           const SizedBox(
            height: 5,
           ),
           Text(
            movie.title,
            maxLines: 2,//se muestre el texto en 2 lineas
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            
           )
        ]),
    );
  }
}