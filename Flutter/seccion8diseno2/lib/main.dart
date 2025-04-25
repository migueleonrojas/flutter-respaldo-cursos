import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(initialPage: 0, keepPage: true);

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children:[
          Stack(
            children: [
              Image.asset(
                "assets/playa.png",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: const  EdgeInsets.only(left: 80, right: 80, top:80, bottom: 15),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children:  [
                        const Text('11°', style: TextStyle(color: Colors.white, fontSize: 50),),
                        const Text('Miércoles', style: TextStyle(color: Colors.white, fontSize: 50),),
                        const Expanded( child: SizedBox(),),
                        IconButton(
                          iconSize: 160,
                          color: Colors.white,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          onPressed: () {
                            _controller.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeInOutQuint);
                          },
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20) ),
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shadowColor: Colors.black
                  ),
                  onPressed: () {},
                  child: const Text('Bienvenidos', style: TextStyle(color: Colors.white, fontSize: 30)),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}