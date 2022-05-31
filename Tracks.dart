import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'Start.dart';


var data;
var ID;
var lyrics;


class Tracks extends StatefulWidget {
  Tracks({this.AllData});
var AllData;
  @override
  
  State<Tracks> createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  @override

 

  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Color(0xff737373),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          child:   ListView.builder(
              itemCount: widget.AllData.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap:()async{
                    await getData2( widget.AllData[i][5]);
                    print(lyrics);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details(AllData: lyrics))
                      // , track_name: allData[i][0] ,track_rating: allData[i][1]  ,num_favourite:allData[i][2],   album_name:   allData[i][3] ,artist_name: allData[i][4] )),
                    );
                  },
                  
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
                    child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white,
                    child: 
                    // Column(
                    //   children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0, right: 20.0, bottom: 10.0, left: 10.0),
                              child: Container(
                                
                                width: 100.0,
                                height:175.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  image: DecorationImage(
                                      fit: BoxFit.cover, 
                                      image: NetworkImage('https://media.istockphoto.com/vectors/music-note-icon-vector-illustration-vector-id1175435360?s=612x612')),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 30,
                            // ),
                            Column(
                              children: [
                                Container(
                                  // color: Colors.blue,
                                  width:250 ,
                                  height:120 ,
                                  child: 

                                  // Column(
                                  //   children: [
                                      ListView(
                                        children:[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom:8.0),
                                            child: Text(
                                              "${ widget.AllData[i][0]}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom:30.0),
                                            child: Text(
                                              "Artist Name: ${ widget.AllData[i][4]}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              // textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Text("Album Name", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 12),),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom:20.0),
                                            child: Text(
                                              "${ widget.AllData[i][3]}",
                                             
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              // textAlign: TextAlign.start,
                                            ),
                                          ),
                                          
                                          
                                        ] 
                                      ),
                                  
                                      
                                      
                                   
                                ),
                                Container(
                                  // color: Colors.orange,
                                  width: 250,
                                  height: 25,
                                  child: Row(
                                    children:[
                                      Text(
                                        "Favourite: ${ widget.AllData[i][2]}",
                                          // "hi",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Icon(Icons.star, color: Colors.yellow[600],),
                                      Text(
                                        "${ widget.AllData[i][1]}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey
                                        ),
                                        textAlign: TextAlign.end,
                                      )
                                    ]
                                  ),
                                )
                              ],
                            ),   
                          ],
                        ),              
                    
                  
                ),
              ),
            )  
          ) 
        ),
      ),
    );
  }}








//  Future<void> getData1() async{
//     try{
//         allData.clear();
//         Response response = await  get(Uri.parse("https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
//         if(response.statusCode == 200){

        
      
//           print(response.statusCode);
//           print(response.body);
//           data = response.body;
          
  


//           for (int i =0; i< data.length; i++){
//             var word1 = jsonDecode(data)['message']['body']['track_list'][i]['track']['track_name'];
//             var word2 = jsonDecode(data)['message']['body']['track_list'][i]['track']['track_rating'];
//             var word3 = jsonDecode(data)['message']['body']['track_list'][i]['track']['num_favourite'];
//             var word4 = jsonDecode(data)['message']['body']['track_list'][i]['track']['album_name'];
//             var word5 = jsonDecode(data)['message']['body']['track_list'][i]['track']['artist_name'];
//             var word6 = jsonDecode(data)['message']['body']['track_list'][i]['track']['track_id'];
//             var fewData=[word1,word2,word3,word4,word5,word6];
//             allData.add(fewData);
//             print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
//             print(allData[i][0]);
//             print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
           
//           }
//               print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//             print(allData);
//             print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          
//         }else{
//           print(response.statusCode);
      
//         }
//     }catch(e){
//       print(e);
     
      
      
//     }
   
//   }

  

Future<void> getData2(track_id) async{
    try{
     
        Response response = await  get(Uri.parse("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$track_id&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
        if(response.statusCode == 200){

        
      
          print(response.statusCode);
          print(response.body);
          data = response.body;
          
  


         
            var word1 = jsonDecode(data)['message']['body']['lyrics']['lyrics_body'];
             lyrics=word1;
            // allData.add(lyrics);
            print("//////////////////////////////////////////////////////////////////////////////////");
            print(lyrics);
           
        }else{
          print(response.statusCode);
      
        }
    }catch(e){
      print(e);
     
      
      
    }
   
  }
