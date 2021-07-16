import 'package:filter_bar/filter_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter bar'),
      ),
      body: Column(
        children: [
          _filter(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (c, index) {
                return ListTile(
                  title: Text('Text$index'),
                  subtitle: Text('This is a sample for filter bar'),
                );
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }

  ///筛选栏
  Widget _filter() {
    return Container(
      height: 30.0,
      color: Colors.white,
      child: FilterBar(
        currentIndex: currentIndex,
        reverse: reverse,
        onTap: (index) {
          setState(() {
            print('index=$index currentIndex=$currentIndex reverse=$reverse');
            if (index == currentIndex) {
              reverse = !reverse;
            } else {
              reverse = false;
            }
            print('index=$index currentIndex=$currentIndex reverse=$reverse');
            currentIndex = index;
          });
        },
        items: [
          FilterBarItem(
              label: '综合',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down),
          FilterBarItem(
            label: '销量',
          ),
          FilterBarItem(
              label: '佣金',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down),
          FilterBarItem(
              label: '售价',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down,
              normal: Icons.switch_left),
          FilterBarItem(
              label: '最新',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down),
          FilterBarItem(
            label: '筛选',
            up: Icons.arrow_drop_up,
            down: Icons.arrow_drop_down,
            imgAssetNormalPath: 'images/flutter.png',
          ),
        ],
      ),
    );
  }
}
