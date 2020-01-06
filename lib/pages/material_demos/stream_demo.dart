import 'dart:async';
import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0 
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data;

  @override
  void dispose() { 
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Create a stream');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream.');
    // _streamSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);
    _streamSubscription = 
      _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

      _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    // throw 'Somethine happen!';
    return 'Hello~~';
  }

  void onError(error) {
    print('Error:$error');
  }

  void onDone() {
    print('Done!');
  }

  void onData(String data) {
    print('$data');
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }

  void _pauseStream() {
    print('Pause Subscription');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume Subscription');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel Subscription');
    _streamSubscription.cancel();
  }

  void _addDataToStream() async{
    print('Add data to Stream');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot){
                return Text('${snapshot.data}');
              },
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'), // 恢复
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'), // 取消；取消后无法恢复
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}