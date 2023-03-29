

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/game.dart';
import '../widgets/game_item.dart';
class  MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override

List<Game> games = [];
Future<List<Game>> fetchGames() async{
  final response = await http
      .get(Uri.parse('https://api.steampowered.com/ISteamApps/GetAppList/v0002/?format=json'));

  if(response.statusCode == 200){
    final result = jsonDecode(response.body);

    for(var element in result) {
      var i = 0;
      final response2 = await http.get(Uri.parse('https://store.steampowered.com/api/appdetails?appids=${element.appid}'));
      final result2 = jsonDecode(response2.body);
      for(var u in result2){
         Game game = Game(id: element["applist"]["apps"][i]["appid"], image: u["${element.appid}"]["data"]["header_image"], name: element["applist"]["apps"][i]["name"], editor: u["${element.appid}"]["data"]["developers"][0], price:15);
            games.add(game);
            i += 1;

      }


    }



  }
  else{
    throw Exception('failed');
  }

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }




}



  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: FutureBuilder(
        future: fetchGames(),
      builder: (BuildContext context , AsyncSnapshot snapshot) {
            return ListView.builder(itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GameItem(snapshot.data[index].id, snapshot.data[index].image, snapshot.data[index].name, snapshot.data[index].editor, snapshot.data[index].price);
            },);
      }


    })
    )

    );
    );

    }





}
