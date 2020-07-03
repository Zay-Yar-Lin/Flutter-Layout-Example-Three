import 'dart:convert';
import 'package:flutter_the_movie/NowPlayingDetail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_the_movie/NowPlaying.dart';

void main() {
  runApp(MaterialApp(
    home:HomePage() ,
  ));
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomePageState() ;
  }

}

class HomePageState extends State<HomePage>{

  var url = "https://api.themoviedb.org/3/movie/now_playing?api_key=670bc282e8edaac05b2f85e6d1895435&language=en-US&page=1";
  Movie movie;
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  fetchData() async{
    var data = await http.get(url);
    var jsonData = jsonDecode(data.body);
    movie = Movie.fromJson(jsonData);
    print(movie.toJson());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        backgroundColor: Colors.green,
      ),
      body: 
      movie == null
      ? Center(child: CircularProgressIndicator())
      : GridView.count( 
        crossAxisCount: 2,
        children:
           movie.results.map((move) => Padding(
             padding: EdgeInsets.all(1.0),
              child: InkWell(onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                new NowPlayingDatail(results: move,)));

              },
              child: Hero(tag: move.posterPath,
               child: Card(
                 color: Colors.black54,
                 elevation: 6,
                 child: Column(
                   mainAxisAlignment: 
                       MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         Container(
                           height: 130,
                           child: Image.network("https://image.tmdb.org/t/p/w200${move.posterPath}"),
                         ),
                         Text(move.title,
                           style: TextStyle(
                             fontSize: 15.0,
                             fontWeight: FontWeight.bold,color: Colors.yellow[700],fontStyle: FontStyle.italic
                           ),)
                       ],
                 ),
               )),
              
              ),
         )
      ).toList()
      )
      );
  }

}




