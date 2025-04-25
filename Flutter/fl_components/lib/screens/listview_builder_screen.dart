import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];

  //esta asociado al list view, se puede saber su valor en todo momento
  final ScrollController scrollController = ScrollController();

  bool isLoading =  false;

  //para saber el valor se crea un listener, estar escuchando el scroll
  //cuando el state se crea por primera y unica vez
  @override
  void initState() {//es como un ngOnInit de angular, parecido
    // TODO: implement initState
    super.initState();
    //agregando el listener, cada vez que algo suceda con el scrool view aqui se va a emitir
    scrollController.addListener(() {
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 500 > scrollController.position.maxScrollExtent ) {
        //add5();
        fetchData();
      }
    });
  }

  Future fetchData() async {

    if (isLoading) return;

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
    setState(() {});
  }

  Future<void> onRefresh() async {//todo: el fade in genera un error, es el archivo que proviene del dart que esta mal adecuado
    await Future.delayed(const Duration(seconds: 2));
    
    final lastId = imagesIds.last;//obtiene el ultimo item + 1
    imagesIds.clear();//se limpia el listado
    imagesIds.add(lastId + 1);
    add5();//cargamos 5 pero desde el ultimo item antes de refrescar
 
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;//obtiene el ancho y el alto que posee la pantalla del dispositivo que esta ejecutando el app

    return  Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(//widget que nos permite quitar el padding que contiene la aplicacion por defecto
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(//widget para colocar widget uno encima del otro
          children: [
            RefreshIndicator(//widget que permite realizar la accion de deslizar hacia abajo estando arriba para refrescar resultados
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,//se va a usar el controller para estar escuchando los cambio del listview, en este caso para saber que tanto esta del final, tambie controla el scroll
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return  FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
                  );
                } ,
              ),
            ),

            if(isLoading)
              Positioned(//para posicionar un widget que esta adentro de un listview
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon()
              )
          ],
        
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator( color: AppTheme.primary )
    );
  }
}