import 'dart:convert';

import 'package:flut_local_json/models/isaret.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Local Json Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Local Json App"),
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            var items = snapshot.data as List<IsaretEkrani>;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          color: Colors.deepPurple,
                          child: Text(
                            "${item.id}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                        title: Text(
                          "${item.adi}",
                          style:
                              TextStyle(fontSize: 18, color: Colors.deepPurple),
                        ),
                        subtitle: Text(
                          "${item.aciklama}",
                          style: TextStyle(fontSize: 18, color: Colors.pink),
                        ),
                      );
                    },
                  ))
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<IsaretEkrani>> readJsonData() async {
    final jsondata =
        await rootBundle.loadString('jsonfield/isaretListesi.json');
    //print(jsondata);
    final list = json.decode(jsondata) as List<dynamic>;
    //print(list);
    return list.map((e) => IsaretEkrani.fromJson(e)).toList();
  }
}
