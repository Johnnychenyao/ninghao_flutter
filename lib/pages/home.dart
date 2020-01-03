import 'package:flutter/material.dart';
import './view_page.dart';
import './material_components.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigration',
          //   onPressed: (){
          //     print('test');
          //   },
          // ),
          title: Text('NINGHAO'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: (){
                print('test');
              },
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black45,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.security)),
              Tab(icon: Icon(Icons.settings_input_svideo)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.settings))
            ],
          ),
        ),
        drawer: _drawer(context),
        body: TabBarView(
          children: <Widget>[
            MaterialComponents(),
            Icon(Icons.settings_input_svideo, size: 128.0,),
            Icon(Icons.settings, size: 128.0,),
            ViewPage()
          ],
        ),
      ),
    );
  }


  // 左侧抽屉
  Widget _drawer(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text('header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100]
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text('j.cHen', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: Text('xxxxx@163.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo4kWdibWTN2VicwwozunjYDwIa8QVmYyic41WJ42Ks4uPOOUZQT2GsibM4ysSAHibkzXt1CEAD6KpkElQ/132'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1576905891831&di=a1da5f4f75d4651f1b74214ff2f6a0c9&imgtype=0&src=http%3A%2F%2Ffile02.16sucai.com%2Fd%2Ffile%2F2015%2F0408%2F779334da99e40adb587d0ba715eca102.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.8),
                  BlendMode.hardLight
                )
              )
            ),
          ),
          ListTile(
            title: Text('Message', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right,),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}