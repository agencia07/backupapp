import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeaderWidget extends StatefulWidget {
  AppHeaderWidget({Key key}) : super(key: key);

  @override
  _AppHeaderWidgetState createState() => _AppHeaderWidgetState();
}

class _AppHeaderWidgetState extends State<AppHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment(0.1, -0.95),
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
