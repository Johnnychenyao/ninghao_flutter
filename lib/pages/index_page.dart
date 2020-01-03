import 'package:flutter/material.dart';
import './home.dart';
import './list_page.dart';
import './sliver_demo.dart';
import './form_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> barItemList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.explore),
      title: Text('explore')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      title: Text('list')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      title: Text('history')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('person')
    ),
  ];

  final List<Widget> tabBodies = [
    Home(),
    SliverDemo(),
    ListPage(),
    FormPage(),
  ];


  void _onTapIndex (int index) {
    setState((){
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        // appBar: AppBar(
        //   // leading: IconButton(
        //   //   icon: Icon(Icons.menu),
        //   //   tooltip: 'Navigration',
        //   //   onPressed: (){
        //   //     print('test');
        //   //   },
        //   // ),
        //   title: Text('NINGHAO'),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.search),
        //       tooltip: 'Search',
        //       onPressed: (){
        //         print('test');
        //       },
        //     )
        //   ],
        //   bottom: TabBar(
        //     unselectedLabelColor: Colors.black45,
        //     indicatorSize: TabBarIndicatorSize.label,
        //     indicatorWeight: 1.0,
        //     tabs: <Widget>[
        //       Tab(icon: Icon(Icons.security)),
        //       Tab(icon: Icon(Icons.settings_input_svideo)),
        //       Tab(icon: Icon(Icons.settings))
        //     ],
        //   ),
        // ),
        body: IndexedStack(
          index: _currentIndex,
          children: tabBodies,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: barItemList,
          onTap: _onTapIndex,
        ),
      ),
    );
  }
}