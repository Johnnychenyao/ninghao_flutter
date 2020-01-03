import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    final Widget _flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget _raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0) // 斜角
              // )
              shape: StadiumBorder()
            )
          ),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey,
            elevation: 0,
            // textColor: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 15.0,),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget _outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0) // 斜角
              // )
              shape: StadiumBorder()
            )
          ),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 15.0,),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: (){},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget _containerWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        )
      ],
    );
    final Widget _fixedWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        )
      ],
    );
    final Widget _fixedWidthButtonDemo2 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
    final Widget _fixedWidthButtonDemo3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(width: 16.0,),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: (){},
            splashColor: Colors.grey[500],
            borderSide: BorderSide(
              color: Colors.black
            ),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // textColor: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
    final Widget _buttomBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 32.0)
            )
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button'),
                onPressed: (){},
                splashColor: Colors.grey[500],
                borderSide: BorderSide(
                  color: Colors.black
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
                // textColor: Theme.of(context).accentColor,
              ),
              OutlineButton(
                child: Text('Button'),
                onPressed: (){},
                splashColor: Colors.grey[500],
                borderSide: BorderSide(
                  color: Colors.black
                ),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
                // textColor: Theme.of(context).accentColor,
              ),
            ],
          ),
        )
      ],
    );
    final Widget _popupMenuButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_currentMenuItem),
        PopupMenuButton(
          onSelected: (value) {
            setState(() {
              _currentMenuItem = value;
            });
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: 'Home',
              child: Text('Home'),
            ),
            PopupMenuItem(
              value: 'List',
              child: Text('List'),
            ),
            PopupMenuItem(
              value: 'Person',
              child: Text('Person'),
            ),
          ],
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _flatButtonDemo,
            _raisedButtonDemo,
            _outlineButtonDemo,
            _containerWidthButtonDemo,
            _fixedWidthButtonDemo,
            _fixedWidthButtonDemo2,
            _fixedWidthButtonDemo3,
            _buttomBarDemo,
            _popupMenuButton
          ],
        ),
      ),
    );
  }
}