import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitlePageWidget extends StatefulWidget {
  TitlePageWidget({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _TitlePageWidgetState createState() => _TitlePageWidgetState();
}

class _TitlePageWidgetState extends State<TitlePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.title2.override(
              fontFamily: 'Poppins',
            ),
          ),
        )
      ],
    );
  }
}
