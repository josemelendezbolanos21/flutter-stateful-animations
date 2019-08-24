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
            ),
            Form(
              child: Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    )
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                      ),
                      MaterialButton(
                        height: 46,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(Icons.keyboard_arrow_right, size: 36.0,),
                        splashColor: Colors.teal[200],
                        onPressed: () => {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

