import 'package:flutter/material.dart';
import '../model/post.dart';
import './post_show.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('NINGHAO'),
            // pinned: true, // appbar固定在顶部 fixed
            floating: true, // 往上滚动就显示，
            expandedHeight: 178.0, // 弹性高度
            flexibleSpace: FlexibleSpaceBar( // 弹性高度
              title: Text(
                'ninghao flutter'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400
                )
              ),
              background: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577443111797&di=fc791ef293f65ac8aba742a8ede49c8c&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2014%2F0829%2F372edfeb74c3119b666237bd4af92be5.jpg',
                fit: BoxFit.cover
              ),
            ),
          ),
          SliverSafeArea( // 显示在安全区域（刘海屏挡住的区域）
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0), // 圆角 /*圆角无效！！！BUG */
              elevation: 14.0, // 阴影
              shadowColor: Colors.grey.withOpacity(0.5), // 阴影颜色以及透明度
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          )
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white
                          )
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white.withOpacity(0.3),
                        highlightColor: Colors.white.withOpacity(0.1),
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PostShow(post: posts[index]))
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ),
          );
        },
        childCount: posts.length
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0  // 宽高比例
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length
      ),
    );
  }
}