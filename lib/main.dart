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
    ],
    'Family': [
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
    ],
  };
 
// Create tabs for bottom property of AppBar, number of tabs depends on number of entries of "data" collection. 
  List<Widget> listOfTabs() {
    List<Widget> listOfTabs = [];
    for (var element in data.entries) {
      listOfTabs.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(element.key.toString()),
        ),
      );
    }
    return listOfTabs;
  }

// Create list of widgets "MylistView". Number of widgets depends on number of entries of Map that reported to this method. 
  List<Widget> listOfListsOfListView(Map<String, dynamic> data) {
    List<Widget> finalList = [];

    for (var dynamics in data.values) {
      finalList.add(
        MylistView(listOfSrc: dynamics),
      );
    }
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MY MEMORIES'),
          centerTitle: true,
          bottom: TabBar(tabs: listOfTabs()),
        ),
        body: TabBarView(children: listOfListsOfListView(data)),
      ),
    );
  }
}

class Imagewidget extends StatelessWidget {
  const Imagewidget({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Image.network(src),
      ),
    );
  }
}

// ignore: camel_case_types
class MylistView extends StatelessWidget {
  const MylistView({super.key, required this.listOfSrc});
  final List<String> listOfSrc;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listOfSrc.length,
        itemBuilder: (BuildContext context, int index) {
          return Imagewidget(src: listOfSrc[index]);
        });
  }
}
