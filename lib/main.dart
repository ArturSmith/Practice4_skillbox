import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, dynamic> data = {
    'My pictures': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Gallery': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  // ignore: non_constant_identifier_names
  List<List<Widget>> ListOfWidgets() {
    List<List<Widget>> mainList = [];
    List<Widget> firstList = [];
    List<Widget> secondList = [];

    for (var element in data.values.first) {
      firstList.add(Imagewidget(src: element));
    }

    for (var element in data.values.last) {
      secondList.add(Imagewidget(src: element));
    }

    mainList.add(firstList);
    mainList.add(secondList);

    return mainList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MY MEMORIES'),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(data.keys.first.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(data.keys.last.toString()),
            ),
          ]),
        ),
        body: TabBarView(children: [
          ListView(children: ListOfWidgets()[0]),
          ListView(children: ListOfWidgets()[1]),
        ]),
      ),
    );
  }
}

class Imagewidget extends StatelessWidget {
   Imagewidget({super.key, required this.src});

  String src;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only( bottom: 10),
        child: Image.network(src),
      ),
    );
  }
}
