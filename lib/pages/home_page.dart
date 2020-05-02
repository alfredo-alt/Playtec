import 'dart:async';
import 'dart:convert';
import 'package:ejemplo_internet/main.dart';
import 'package:ejemplo_internet/pages/persona.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

  

Future<List<dynamic>> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body);
  } else {
    // If the server did not return a 200 OK response,fgfd
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



class InicioPage extends StatefulWidget {
  InicioPage({Key key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  Future futureAlbum;
  String _texto;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Los menos gracioses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:Scaffold(
        appBar: AppBar(
          title: TextField(onChanged: (dato){_texto=dato;
          main();
          print(_texto);},),     
        ),
        body: Center(
        child:
        FutureBuilder(
        future: futureAlbum,
            builder: (context,  snapshot) {
                if (snapshot.hasData) {
                return ListView(
               children:
                _listitms(snapshot.data,context,_texto), );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
        ),
        );
  }
  List <Widget> _listitms(List<dynamic> data,BuildContext context,String buscador){
   print(buscador);
  List <Widget> opciones = [];
  
  data.forEach( (ot) {
    if(buscador==''||buscador==null){     
    final widgetTemp= ListTile( 
      title: Text(ot['name']),
      trailing: Icon(Icons.people),
      onTap: (){
        Navigator.of(context).push(_createRoute(ot['name'],(ot['id']).toString(),ot['phone'],ot['username'],ot['website']));
      //Navigator.pushNamed(context, ot['name']);
     //   final route = MaterialPageRoute(builder: (context){
        
       // return  nombrepersonal(ot['name'],(ot['id']).toString(),ot['phone'],ot['username'],ot['website']);
       // });
        //Navigator.push(context, route);

      },  
    );
    opciones..add(widgetTemp)
    ..add(Divider());}
    else if(buscador==ot['name']){
      final widgetTemp= ListTile(
      title: Text(ot['name']),
      trailing: Icon(Icons.people),
      onTap: (){
        Navigator.of(context).push(_createRoute(ot['name'],(ot['id']).toString(),ot['phone'],ot['username'],ot['website']));
      //Navigator.pushNamed(context, ot['name']);
     //   final route = MaterialPageRoute(builder: (context){
        
       // return  nombrepersonal(ot['name'],(ot['id']).toString(),ot['phone'],ot['username'],ot['website']);
       // });
        //Navigator.push(context, route);

      },  
    );
    opciones..add(widgetTemp)
    ..add(Divider());
    } 
  }
  
  );
  
  return opciones;
  }

}
Route _createRoute(String a,String b,String c,String d,String e) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  nombrepersonal(a,b,c,d,e),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}