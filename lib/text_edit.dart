import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/app_state.dart';
import 'package:provider/provider.dart';

class TextEditWidget extends StatefulWidget {
  @override
  _TextEditWidgetState createState() => _TextEditWidgetState();
}

class _TextEditWidgetState extends State<TextEditWidget> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          labelText: "Some Text",
          border: OutlineInputBorder(),
        ),
        onChanged: (changed) => appState.setDisplayText(changed),
        onSubmitted: (submitted) => appState.setDisplayText(submitted),
      ),
    );
  }
}
