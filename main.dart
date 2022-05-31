import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:http/http.dart';
import 'dart:convert';


var allData= [];
var data;


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
          
            var fewData=[word1,word2,word3,word4,word5];
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



void main() => runApp(App());

 
class App extends StatelessWidget {

  
  
 @override
 
 Widget build(BuildContext context)  {
   
   return MaterialApp(
     theme: ThemeData(
       primaryColor: Colors.orange,
     ),
    //  title: 'My Flutter App',
     home: Home(AllData: allData,),
   );
 }
}


