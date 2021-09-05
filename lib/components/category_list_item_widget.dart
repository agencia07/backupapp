import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListItemWidget extends StatefulWidget {
  CategoryListItemWidget({
    Key key,
    this.name,
    this.imagePath,
  }) : super(key: key);

  final String name;
  final String imagePath;

  @override
  _CategoryListItemWidgetState createState() => _CategoryListItemWidgetState();
}

class _CategoryListItemWidgetState extends State<CategoryListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Align(
            alignment: Alignment(0, 0),
            child: Image.network(
              widget.imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0),
          child: Text(
            widget.name,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
