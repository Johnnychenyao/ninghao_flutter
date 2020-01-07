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
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}