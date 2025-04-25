import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stan Lee'),
        actions:  [//en el appbar los actions son otros widgets que se pueden colocar aca
          Container(
            margin: const EdgeInsets.only(right:5),
            child:  CircleAvatar(
              backgroundColor: Colors.teal[900],
              child: const Text('SL'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 220,//tamano del circle avatar, pero con la medida de su radio
          backgroundImage: NetworkImage('https://live.staticflickr.com/1697/25638463674_3f9f7f6f5e_b.jpg'),
         ),
      ),
    );
  }
}