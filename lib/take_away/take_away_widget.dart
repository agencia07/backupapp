import '../backend/backend.dart';
import '../components/category_list_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeAwayWidget extends StatefulWidget {
  TakeAwayWidget({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _TakeAwayWidgetState createState() => _TakeAwayWidgetState();
}

class _TakeAwayWidgetState extends State<TakeAwayWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment(0.1, -0.95),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'Take Away',
                style: FlutterFlowTheme.title3.override(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<CategoriesRecord>>(
                stream: queryCategoriesRecord(
                  queryBuilder: (categoriesRecord) =>
                      categoriesRecord.orderBy('order'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  List<CategoriesRecord> listViewCategoriesRecordList =
                      snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    return Material(
                      child: Container(
                        height: 100,
                        child: Center(
                          child: Text('No results.'),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCategoriesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCategoriesRecord =
                          listViewCategoriesRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: CategoryListItemWidget(
                          name: listViewCategoriesRecord.name,
                          imagePath: listViewCategoriesRecord.image,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
