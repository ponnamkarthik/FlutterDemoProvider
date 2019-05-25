import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/app_state.dart';
import 'package:flutter_demo_provider/response_display.dart';
import 'package:flutter_demo_provider/text_display.dart';
import 'package:flutter_demo_provider/text_edit.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<AppState>(
          builder: (_) => AppState(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextDisplay(),
                TextEditWidget(),
                RaisedButton(
                  onPressed: () => appState.fetchData(),
                  child: Text("Fetch Data from Network"),
                ),
                ResponseDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
