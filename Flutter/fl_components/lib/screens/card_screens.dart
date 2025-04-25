import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
             CustomCardType1(),
             SizedBox(height: 10),
             CustomCardType2(imageUrl: 'https://estaticos.muyinteresante.es/uploads/images/gallery/5fdb5c275bafe84538c58d95/1-puesta-de-sol.jpg'),
             SizedBox(height: 20),
             CustomCardType2(imageUrl: 'https://cloudfront-us-east-1.images.arcpublishing.com/culturacolectiva/TUACZVYNA5B47PATC6XZJNOCZ4.jpg'),
             SizedBox(height: 20),
             CustomCardType2(name: 'Un cielo estrellado', imageUrl: 'https://cronicaglobal.elespanol.com/uploads/s1/13/74/78/91/mujer-ante-un-cielo-estrellado.jpeg'),
             SizedBox(height: 100),
          ],
        ));
  }
}


