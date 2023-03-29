import 'package:flutter/material.dart';
class  GameItem extends StatelessWidget {
  final int appid;
  final String imageUrl;
  final String title;
  final String name_editor;
  final int prices;

  GameItem(this.appid,
      this.imageUrl,
      this.title,
      this.name_editor,
      this.prices);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Container(
            child: Text(title),


          ),
          Container(
            child: Text(name_editor),
          ),
          Container(
            child: Text('${prices}'),
          ),
          Container(
              child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover
              )
          ),
          Container(
              child: ElevatedButton(
                child: Text('EN SAVOIR PLUS'),
                onPressed: () =>
                {
                },
              )
          )


        ]

    );
  }
}
