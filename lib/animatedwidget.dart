import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimMyApp extends StatefulWidget {
  const AnimMyApp({Key? key}) : super(key: key);

  @override
  State<AnimMyApp> createState() => _AnimMyAppState();
}

class _AnimMyAppState extends State<AnimMyApp>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Picture layout demo home page',
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({required this.title, required this.animation});

  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Picture Listing"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              String url = "https://en.wikipedia.org/wiki/Tom_and_Jerry/";
              var urllauncable = await canLaunch(url);
              if (urllauncable) {
                await launch(url);
              } else {
                print("Url can't Launch");
              }
            },
            child: FadeTransition(
              child: PictureBox(
                name: "Tom & Jerry",
                description:
                    "Mickey Mouse is an animated cartoon character \n co-created in 1928 by Watt Disney",
                price: 1000,
                image: "tom.jpg",
              ),
              opacity: animation,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              String url = "https://en.wikipedia.org/wiki/Mickey_Mouse";
              var urllauncable = await canLaunch(url);
              if (urllauncable) {
                await launch(url);
              } else {
                print("Url can't Launch");
              }
            },
            child: MyAnimatedWidget(
                child: PictureBox(
                    name: "Mickey Mouse",
                    description:
                        "Mickey Mouse is an animated cartton character",
                    price: 800,
                    image: "mickey.jpg"),
                animation: animation),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              String url = "https://en.wikipedia.org/wiki/Doraemon";
              var urllauncable = await canLaunch(url);
              if (urllauncable) {
                await launch(url);
              } else {
                print("Url can't Launch");
              }
            },
            child: MyAnimatedWidget(
                child: PictureBox(
                    name: "Doremon",
                    description: "Doremon is an animated cartoon character",
                    price: 1200,
                    image: "doremon.png"),
                animation: animation),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              String url = "https://en.wikipedia.org/wiki/Pok%C3%A9mon";
              var urllauncable = await canLaunch(url);
              if (urllauncable) {
                await launch(url);
              } else {
                print("Url can't Launch");
              }
            },
            child: MyAnimatedWidget(
                child: PictureBox(
                    name: "Pokemon",
                    description: "Pokemon is an animated cartoon character",
                    price: 1100,
                    image: "pika.png"),
                animation: animation),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              String url = "https://en.wikipedia.org/wiki/Crayon_Shin-chan";
              var urllauncable = await canLaunch(url);
              if (urllauncable) {
                await launch(url);
              } else {
                print("Url can't Launch");
              }
            },
            child: MyAnimatedWidget(
                child: PictureBox(
                    name: "Shinchan",
                    description: "Shinchan is an animated cartoon character",
                    price: 2000,
                    image: "shinchan.jpg"),
                animation: animation),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class PictureBox extends StatelessWidget {
  PictureBox(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/" + image),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    this.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(this.description),
                  Text("price:" + this.price.toString()),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
                  child: Opacity(
                    opacity: animation.value,
                    child: child,
                  ),
                ),
            child: child),
      );
}
