import 'package:flutter/material.dart';


class Details extends StatefulWidget {
  Details({this.AllData, });
  // this.track_name, this.track_rating, this.num_favourite, this.album_name, this.artist_name});
  var AllData;
  var track_name;
  var track_rating;
  var num_favourite;
  var album_name;
  var artist_name;


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
 Widget build(BuildContext context) {
    // print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
    // tfName();
    return 
    // SafeArea(
    //   child: 
      Scaffold(
        backgroundColor: Colors.grey[350],
        body: ListView(
            children:[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      
                
                Text("Lyrics", style: TextStyle(fontWeight:FontWeight.w900, fontSize: 35), textAlign: TextAlign.center,),
                
                // Text("${widget.rat}", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, top:30.0, right:10.0, bottom:10.0),
                  child: Text("${widget.AllData}", style: TextStyle(fontWeight:FontWeight.normal, fontSize: 15), textAlign: TextAlign.center,),
                ),
                

              
                

                
                    ]
                  ),
                  
                ),
              ),
              
            ]
          // ),
        ),
      // ),
    );
  }
}


