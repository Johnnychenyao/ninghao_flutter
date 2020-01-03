import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  PostShow({
    @required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16/9,
            child: Image.network(
              post.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: <Widget>[
                Text('${post.title}', style: Theme.of(context).textTheme.title),
                Text('${post.author}', style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 32.0,),
                Text('${post.desc}', style: Theme.of(context).textTheme.body1),
              ],
            ),
          )
        ],
      ),
    );
  }
}