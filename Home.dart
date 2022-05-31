import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'Search.dart';
import 'Start.dart';
import 'Tracks.dart';



var allData= [];
var data;
var ID;
var lyrics;



class Home extends StatefulWidget {
 Home({this.AllData});
  var AllData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 1;
  final List<Widget> children = [
    Tracks(AllData: allData),
    // Homes(data: allData),
    // School2(),
    Search(),
    // School2(lis: lis, image: image, ep: ep, rat: rat, start: start, end: end, jap: jap, dis: dis, con: count)
   
  ];
  @override


@override
 Widget build(BuildContext context) {
   return Scaffold(
     
     appBar: AppBar(
       title: Text('Tracks', style: TextStyle(color:Colors.orange, fontFamily: 'Lobster'),),
       backgroundColor: Colors.white,
     ),
     body: children[currentIndex], 
     bottomNavigationBar: BottomNavigationBar(
       selectedItemColor:Colors.orange,
       onTap: onTabTapped, // new
       currentIndex:  currentIndex, 
      //  currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.trending_up),
           label: 'Trending',
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.search),
           label: 'Search',
         ),
         
       ],
     ),
   );
   
 }
 void onTabTapped(int index)async {
   if(index ==0){
     await getData1();
   }
  
   setState(() {currentIndex = index;});
 }
}


































//   Widget build(BuildContext context) {
//      return Scaffold(
        
//         body: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50),),
//                 color: Colors.orange[100],
//                 ),
//                 width: 410,
//                 height: 200,
                
//                 ),
              
//             // Text("Business"),
//               Padding(
//                 padding: const EdgeInsets.only(top:0.0, right: 30.0, bottom: 20.0, left: 30.0),
//                 child: TextField(
//                   cursorColor: Colors.orange,
//                   decoration: InputDecoration(
//                     // helperText: "yugyujh",
                    
//                     hintText: "TRACK ID  e.g: 161013321",
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
//                   ),
//                   onChanged:(value){                
//                     ID = value;
//                     print(ID);
//                   }
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment : MainAxisAlignment.center,
//                 children: [              
//                   MaterialButton(onPressed: ()async{
//                     setState(() {
//                     // sip = true;
//                   });
//                     await getData();
//                     setState(()  {
                    
//                     showModalBottomSheet(context: context, builder: info);
//                     // sip = false;
//                   });
                      
//                   }, child: Text('Search', style: TextStyle( fontFamily: 'Lobster', fontSize: 30), )),
//                   Icon(Icons.search, color: Colors.orange),
                  
//                 ],
//               ) ,
              
//               Row(
//                  mainAxisAlignment : MainAxisAlignment.center,
//                 children: [ MaterialButton(onPressed: ()async{
//                       setState(() {
//                       // sip = true;
//                     });
//                       await getData1();
//                       setState(()  {
                      
//                       showModalBottomSheet(context: context, builder: info);
//                       // sip = false;
//                     });
                        
//                     }, child: Text('Tracks', style: TextStyle( fontFamily: 'Lobster', fontSize: 30), )),

              
//                   Icon(Icons.search, color: Colors.orange), 
//           ]
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: GestureDetector(
//                       onTap: ((){
//                         //  showModalBottomSheet(context: context, builder: infoYuvi);
//                       }

//                       ),
//                       child: 
//                         Text("About Creator: Yuvraj Sinha", style: TextStyle(fontWeight: FontWeight.bold),
//                       )
//                     ),
//                 ),
//               ),
//             )
//           ],
//         ),
      
//     );
//   }
  
// }








// // 161013321


    Future<void> getData1() async{
    try{
        allData.clear();
        Response response = await  get(Uri.parse("https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
        if(response.statusCode == 200){

        
      
          print(response.statusCode);
          print(response.body);
          data = response.body;
          
  


          for (int i =0; i< data.length; i++){
            var word1 = jsonDecode(data)['message']['body']['track_list'][i]['track']['track_name'];
            var word2 = jsonDecode(data)['message']['body']['track_list'][i]['track']['track_rating'];
            var word3 = jsonDecode(data)['message']['body']['track_list'][i]['track']['num_favourite'];
            var word4 = jsonDecode(data)['message']['body']['track_list'][i]['track']['album_name'];
            var word5 = jsonDecode(data)['message']['body']['track_list'][i]['track']['artist_name'];
            var word6 = jsonDecode(data)['message']['body']['track_list'][i]['track']['track_id'];
            var fewData=[word1,word2,word3,word4,word5,word6];
            allData.add(fewData);
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
            print(allData[i][0]);
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
           
          }
              print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            print(allData);
            print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
          
        }else{
          print(response.statusCode);
      
        }
    }catch(e){
      print(e);
     
      
      
    }
   
  }



//    Future<void> getData() async{
//     try{
//         allData.clear();
//         Response response = await  get(Uri.parse("https://api.musixmatch.com/ws/1.1/track.get?track_id=$ID&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
//         if(response.statusCode == 200){

        
      
//           print(response.statusCode);
//           print(response.body);
//           data = response.body;
          
  


         
//             var word1 = jsonDecode(data)['message']['body']['track']['track_name'];
//             var word2 = jsonDecode(data)['message']['body']['track']['track_rating'];
//             var word3 = jsonDecode(data)['message']['body']['track']['num_favourite'];
//             var word4 = jsonDecode(data)['message']['body']['track']['album_name'];
//             var word5 = jsonDecode(data)['message']['body']['track']['artist_name'];
//             var word6 = jsonDecode(data)['message']['body']['track']['track_id'];
          
//             var fewData=[word1,word2,word3,word4,word5,word6];
//             allData.add(fewData);
//             print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
//             print(allData[0]);
//             print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
           
   
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




// Future<void> getData2(track_id) async{
//     try{
//         allData.clear();
//         Response response = await  get(Uri.parse("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$track_id&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7"));
//         if(response.statusCode == 200){

        
      
//           print(response.statusCode);
//           print(response.body);
//           data = response.body;
          
  


         
//             var word1 = jsonDecode(data)['message']['body']['lyrics']['lyrics_body'];
//              lyrics=word1;
//             // allData.add(lyrics);
//             print("//////////////////////////////////////////////////////////////////////////////////");
//             // print(lyrics);
           
//         }else{
//           print(response.statusCode);
      
//         }
//     }catch(e){
//       print(e);
     
      
      
//     }
   
//   }







  
// Widget info (BuildContext context){

//     return Scaffold(
//       backgroundColor: Color(0xff737373),
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.orange[100],
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
//           ),
//           child:   ListView.builder(
//               itemCount: allData.length,
//               itemBuilder: (context, i) => GestureDetector(
//                 onTap:()async{
//                     await getData2(allData[i][5]);
//                     print(lyrics);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Details(AllData: lyrics))
//                       // , track_name: allData[i][0] ,track_rating: allData[i][1]  ,num_favourite:allData[i][2],   album_name:   allData[i][3] ,artist_name: allData[i][4] )),
//                     );
//                   },
                  
//                   child: Padding(
//                     padding: const EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
//                     child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     color: Colors.white,
//                     child: 
//                     // Column(
//                     //   children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top:10.0, right: 20.0, bottom: 10.0, left: 10.0),
//                               child: Container(
                                
//                                 width: 100.0,
//                                 height:175.0,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.grey),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover, 
//                                       image: NetworkImage('https://media.istockphoto.com/vectors/music-note-icon-vector-illustration-vector-id1175435360?s=612x612')),
//                                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  
//                                   color: Colors.orangeAccent,
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(
//                             //   width: 30,
//                             // ),
//                             Column(
//                               children: [
//                                 Container(
//                                   // color: Colors.blue,
//                                   width:250 ,
//                                   height:120 ,
//                                   child: 

//                                   // Column(
//                                   //   children: [
//                                       ListView(
//                                         children:[
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom:8.0),
//                                             child: Text(
//                                               "${allData[i][0]}",
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w900,
//                                               ),
//                                               textAlign: TextAlign.start,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom:30.0),
//                                             child: Text(
//                                               "Artist Name: ${allData[i][4]}",
//                                               style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               // textAlign: TextAlign.start,
//                                             ),
//                                           ),
//                                           Text("Album Name", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 12),),
//                                           Padding(
//                                             padding: const EdgeInsets.only(bottom:20.0),
//                                             child: Text(
//                                               "${allData[i][3]}",
                                             
//                                               style: TextStyle(
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.normal,
//                                               ),
//                                               // textAlign: TextAlign.start,
//                                             ),
//                                           ),
                                          
                                          
//                                         ] 
//                                       ),
                                  
                                      
                                      
                                   
//                                 ),
//                                 Container(
//                                   // color: Colors.orange,
//                                   width: 250,
//                                   height: 25,
//                                   child: Row(
//                                     children:[
//                                       Text(
//                                         "Favourite: ${allData[i][2]}",
//                                           // "hi",
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.grey
//                                         ),
//                                         textAlign: TextAlign.start,
//                                       ),
//                                       SizedBox(
//                                         width: 100,
//                                       ),
//                                       Icon(Icons.star, color: Colors.yellow[600],),
//                                       Text(
//                                         "${allData[i][1]}",
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.grey
//                                         ),
//                                         textAlign: TextAlign.end,
//                                       )
//                                     ]
//                                   ),
//                                 )
//                               ],
//                             ),   
//                           ],
//                         ),              
                    
                  
//                 ),
//               ),
//             )  
//           ) 
//         ),
//       ),
//     );
//   }