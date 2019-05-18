import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/app_state.dart';
import 'package:provider/provider.dart';

class ResponseDisplay extends StatefulWidget {
  @override
  _ResponseDisplayState createState() => _ResponseDisplayState();
}

class _ResponseDisplayState extends State<ResponseDisplay> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: appState.isFetching
          ? CircularProgressIndicator()
          : Text(
              appState.getResponseText,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
    );
  }
}
