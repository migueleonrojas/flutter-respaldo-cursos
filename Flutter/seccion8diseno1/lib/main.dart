import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(   
        body: Column(
          children:  [
           const FadeInImage(
              width: double.infinity,
              placeholder:  AssetImage('assets/loading.gif'),
              image: NetworkImage('https://media.istockphoto.com/photos/extreme-close-up-of-thrashing-emerald-ocean-waves-picture-id1368264124?b=1&k=20&m=1368264124&s=170667a&w=0&h=VzwEBjaq609S8HxHQdT47HB6WRP-MO_bkXgxo9MdGMI='),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Oeschinen Lake Campground', style: textTheme.headline6,),
                          Text('Kandersteg, Switzerland', style: textTheme.subtitle1,textAlign: TextAlign.right,)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 25, color: Colors.red,),
                          const SizedBox(width: 5,),
                          Text('5', style: textTheme.caption,)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.call, size: 35, color: Colors.blue,),
                          SizedBox(height: 10,),
                          Text('CALL', style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      const SizedBox(width: 80,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.near_me, size: 35, color: Colors.blue,),
                          SizedBox(height: 10,),
                          Text('ROUTE', style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      const SizedBox(width: 80,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.share, size: 35, color: Colors.blue,),
                          SizedBox(height: 10,),
                          Text('SHARE', style: TextStyle(fontSize: 20),)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  const Text(
                    'Ut in consequat fugiat reprehenderit nostrud culpa excepteur Lorem anim tempor sunt. Proident labore culpa incididunt excepteur ea. Nulla dolor nostrud veniam commodo fugiat eu id reprehenderit quis non incididunt est ex. Nulla non elit ullamco minim anim id. Nostrud in ipsum anim deserunt mollit sunt fugiat id incididunt ad laborum irure id. Magna cillum deserunt ad nisi aute laborum veniam et id. Cupidatat ex ut deserunt occaecat adipisicing. Consequat sit commodo ullamco dolor culpa. Quis eiusmod elit officia Lorem et do reprehenderit excepteur. Nostrud mollit deserunt enim officia.',
                    textAlign: TextAlign.justify,
                  )
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}