import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => (
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class LoginPage extends StatefulWidget {
  @override
   State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  with SingleTickerProviderStateMixin{
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      )
    );

    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.greenAccent,
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          "https://images.pexels.com/photos/2646919/pexels-photo-2646919.jpeg",
          fit: BoxFit.cover,
          height: double.infinity,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: _iconAnimation.value * 80,
            )
          ],
        )
      ],
    ),
  );
}

