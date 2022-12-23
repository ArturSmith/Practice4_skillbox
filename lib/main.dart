import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage());
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

  List<Widget> tabsGenerator() {
    final List<Widget> listOfTabs = [];
    for (var element in data.entries) {
      listOfTabs.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(element.key.toString(), style: const TextStyle(color: Colors.blue),),
        ),
      );
    }
    return listOfTabs;
  }

  List<Widget> listViewGenerator(Map<String, dynamic> data) {
    final List<Widget> finalList = [];

    for (var dynamics in data.values) {
      finalList.add(
        MyListView(listOfSrc: dynamics),
      );
    }
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('My images', style: TextStyle(color: Colors.blue),),
              bottom: TabBar(tabs: tabsGenerator()),
              elevation: 50,
            ),
            body: Center(
              child: Container(
                color: Colors.white,
                child: TabBarView(
                  children: listViewGenerator(data),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage.assetNetwork(
          placeholder: 'assets/Spinner-1.3s-197px.gif', image: src),
    );
  }
}

// ignore: camel_case_types
class MyListView extends StatelessWidget {
  const MyListView({super.key, required this.listOfSrc});
  final List<String> listOfSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: listOfSrc.length,
        itemBuilder: ((context, index) {
          return ImageWidget(src: listOfSrc[index]);
        }),
      ),
    );
  }
}
