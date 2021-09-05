import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:backup_app/login/login_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'take_away/take_away_widget.dart';
import 'menu_do_dia/menu_do_dia_widget.dart';
import 'aguas/aguas_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<BackupAppFirebaseUser> userStream;
  BackupAppFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = backupAppFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backup App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? Center(
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LoginWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'TakeAway';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'TakeAway': TakeAwayWidget(),
      'Menu_do_Dia': MenuDoDiaWidget(),
      'Aguas': AguasWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.takeout_dining,
              size: 24,
            ),
            label: 'Take Away',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu_outlined,
              size: 24,
            ),
            label: 'Menu do Dia',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_drink_outlined,
              size: 24,
            ),
            label: 'Águas',
          )
        ],
        backgroundColor: Colors.white,
        currentIndex: tabs.keys.toList().indexOf(_currentPage),
        selectedItemColor: Color(0xFF45748D),
        unselectedItemColor: Color(0xFF0D2836),
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // Temporary fix for https://github.com/flutter/flutter/issues/84556
        unselectedLabelStyle: const TextStyle(fontSize: 0.001),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
