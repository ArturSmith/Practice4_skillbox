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
  List<Widget> listOfListView(Map<String, dynamic> data) {
    List<Widget> finalList = [];

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
              actions: [],
              title: const Text('My images'),
              bottom: TabBar(tabs: listOfTabs()),
              elevation: 30,
            ),
            floatingActionButton: const FloatingButton(),
            //const FloatingButton(),
            body: Center(
              child: Container(
                color: Colors.white,
                child: TabBarView(
                  children: listOfListView(data),
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

  @override
  bool get wantKeepAlive => true;
}

// ignore: camel_case_types
class MyListView extends StatefulWidget {
  const MyListView({super.key, required this.listOfSrc});
  final List<String> listOfSrc;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: widget.listOfSrc.length,
        itemBuilder: ((context, index) {
          return ImageWidget(src: widget.listOfSrc[index]);
        }),
      ),
    );
  }
}

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add new image'),
          content: const Text('Input src of image, for example: https://...'),
          actions: <Widget>[
            const TextField(),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

