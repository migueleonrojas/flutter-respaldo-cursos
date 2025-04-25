



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';


part 'stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<String>> usersInChat (Ref ref) async* {  

//  async* = significa que va a esperar un Stream,  
//  es como el Future pero del Stream
//

  final names = <String>[];
  //yield names;

  // con el (await for) obtendremos el nombre por cada emision del stream 'randomNameStream'
  await for (final name in RandomGenerator.randomNameStream()) {

    // nota no se hace el yield aqui por el contexto del for, por eso se crea una variable en el
    // contexto del provider, es decir en bloque principal del provider
    names.add(name);

    yield names;

  }

}

