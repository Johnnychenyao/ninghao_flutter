import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List _tagList = [
    'Apple',
    'Banana',
    'Lemon'
  ];

  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0 
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Snoasdfaweoutag asdf asdf '),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Life'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('J'),
                  ),
                ),
                Chip(
                  label: Text('J.Chen'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo4kWdibWTN2VicwwozunjYDwIa8QVmYyic41WJ42Ks4uPOOUZQT2GsibM4ysSAHibkzXt1CEAD6KpkElQ/132'),
                  ),
                ),
                Chip(
                  label: Text('Life'),
                  onDeleted: (){},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove thig tag', // 长按显示提示
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tagList.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: (){
                        setState(() {
                          _tagList.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tagList.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: $_selected'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tagList.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tagList.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tagList = [
              'Apple',
              'Banana',
              'Lemon'
            ];

            _selected = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}