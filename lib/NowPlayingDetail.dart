import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_the_movie/NowPlaying.dart';

class NowPlayingDatail extends StatelessWidget{
  final Results results;
  NowPlayingDatail({this.results});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    color: Colors.black54,
                    height: 300,
                    child: Center(
                      child: Image.network("https://image.tmdb.org/t/p/w200${this.results.posterPath}",
                      fit: BoxFit.fill,),
                    ),
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    elevation: 0,
                  )
                ],
              ),
            
              Padding(padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15,),
                  Text(this.results.title,style: TextStyle(color: Colors.yellow,fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 0.2,wordSpacing: 0.6),),
                  SizedBox(height: 15,),
                  Text(this.results.overview,style: TextStyle(color: Colors.white,fontSize: 14,),),
                  SizedBox(height: 15 ,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(this.results.releaseDate == null?
                       'Unknow': this.results.releaseDate,style: TextStyle(color: Colors.black54,fontSize: 13),),
                       Text(this.results.originalTitle,style: TextStyle(color: Colors.black54,fontSize: 13),)
                    ],
                  )

                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }

}