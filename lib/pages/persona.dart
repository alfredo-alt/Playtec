import 'package:flutter/material.dart';
class nombrepersonal extends StatefulWidget {
 final String a;
 final String b;
 final String c;
 final String d;
 final String i;
nombrepersonal(this.a,this.b,this.c,this.d,this.i);  
  @override
  _nombrepersonalState createState() => _nombrepersonalState();
}

class _nombrepersonalState extends State<nombrepersonal> {
  String _e;
  String _f;
  String _g;
  String _h;
  String _j;
  @override
  void initState() {
    super.initState();
    _e = widget.a;
    _f=widget.b;
    _g=widget.c;
    _h=widget.d;
    _j=widget.i;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Persona'),),
       body: Center(
       child: Column(
  
  children: <Widget>[
    GradientAppBar("El sujeto fue detectado"),
    Container(
      height: 50,
      color: Colors.amber[600],
      child: Center(child: Text('id: '+_f)),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child: Center(child: Text('name: '+_e)),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: Center(child: Text('username: '+_h)),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: Center(child: Text('phone: '+_g)),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: Center(child: Text('website: '+_j)),
    ),
    ],
       )
),
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.arrow_back),
    onPressed: (){
      Navigator.pop(context);
    },
  ),
    );
  }
  
}

class GradientAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 50.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: new Center(
        child: new Text(
          title,
          style: new TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [Colors.red, Colors.blue],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp
        ),
      ),
    );
  }
}
