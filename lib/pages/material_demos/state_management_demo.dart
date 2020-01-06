import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('StateManagementDemo'),
  //       elevation: 0.0 
  //     ),
  //     body: CounterWrapper(_count, _increaseCount),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.add),
  //       onPressed: _increaseCount,
  //     ),
  //   );
  // }
  
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0 
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

/*
 * 多层组件时，数据要一层一层去传递
*/
class CounterWrapper extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;

  // CounterWrapper(this.count,this.increaseCount);

  @override
  Widget build(BuildContext context) {
    // return Counter(count, increaseCount);
    return Counter();
  }
}

class Counter extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;

  // Counter(this.count,this.increaseCount);

  @override
  Widget build(BuildContext context) {
    final count = CounterProvider.of(context).count;
    final increaseCount = CounterProvider.of(context).increaseCount;
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}
/*------------------------------------ */

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child
  }) : super(child: child);

  //  静态方法 其他小部件可以用of方法得到数据
  static CounterProvider of(BuildContext context) =>
    context.inheritFromWidgetOfExactType(CounterProvider);

  // 当数据一样就不需要重建
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

