import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxdartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxdartDemo'),
        elevation: 0.0
      ),
      body: RxdartDemoHome(),
    );
  }
}

class RxdartDemoHome extends StatefulWidget {
  @override
  _RxdartDemoHomeState createState() => _RxdartDemoHomeState();
}

class _RxdartDemoHomeState extends State<RxdartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    // Observable<String> _observable = 
    //   // Observable(Stream.fromIterable(['hello','hi']));
    //   // Observable.fromFuture(Future.value('Hello'));
    //   // Observable.fromIterable(['hello','hi']);
    //   Observable.periodic(Duration(seconds: 3), (x) => x.toString()); // 每隔3秒，执行

    // _observable.listen(print);


    /* PublishSubject*/
    // PublishSubject<String> _subject = PublishSubject<String>();
    // _subject.listen((data) => print('listen 1:$data')); // 添加了监听方法，
    // _subject.add('hello');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 2:${data.toUpperCase()}')); // 要先添加方法，然后再添加数据，才会执行

    // _subject.close();

    /* BehaviorSubject*/
    // BehaviorSubject<String> _bSubject = BehaviorSubject<String>();
    // _bSubject.add('hello!!!!!!');
    // _bSubject.add('hello');
    // _bSubject.add('hi');  // 内容顶替了，只有这行执行
    // _bSubject.listen((data) => print('listen 1:$data')); 
    // _bSubject.listen((data) => print('listen 2:${data.toUpperCase()}')); 

    // _bSubject.close();

    /* BehaviorSubject*/
    // ReplaySubject<String> _rSubject = ReplaySubject<String>(maxSize: 2); // maxSize设置最大接收数据数；
    // _rSubject.add('haha'); // maxSize设置后，被下面顶替了，不监听
    // _rSubject.add('hello');
    // _rSubject.add('hi');
    // _rSubject.listen((data) => print('listen 1:$data')); // 接收且监听了全部数据
    // _rSubject.listen((data) => print('listen 2:${data.toUpperCase()}')); // 接收且监听了全部数据

    // _rSubject.close();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
      // .map((item) => 'item:$item')
      .map((item) => 'item.length:${item.length}, item:$item')
      // .where((item) => item.length > 9)
      .debounce(Duration(milliseconds: 500)) // 延迟500毫秒执行listen
      .listen((data) => print(data));
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}