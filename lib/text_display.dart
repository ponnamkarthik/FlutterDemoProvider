import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/app_state.dart';
import 'package:provider/provider.dart';

class TextDisplay extends StatefulWidget {
  @override
  _TextDisplayState createState() => _TextDisplayState();
}

class _TextDisplayState extends State<TextDisplay> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        appState.getDisplayText,
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
