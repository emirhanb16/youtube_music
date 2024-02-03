// Bu sayfa main sayfası.Burada sekmeler bulunmaktadır.Route ayarlayarak sekmelere gidilir.İlk olarak login screenden başlar.


import 'package:flutter/material.dart';
import 'package:ytmusic_sample/screens/homeScreen.dart';
import 'package:ytmusic_sample/screens/library.dart';
import 'package:ytmusic_sample/screens/loginScreen.dart';
import 'package:ytmusic_sample/screens/profileScreen.dart';
import 'package:ytmusic_sample/screens/registerScreen.dart';
import 'package:ytmusic_sample/screens/settingsScreen.dart';
import 'package:ytmusic_sample/screens/usersScreen.dart';
import 'package:ytmusic_sample/screens/iletisim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Homescreen(),
        '/login': (context) => LoginScreen(),
        '/library': (context) => Library(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => profileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/usersScreen': (context) => UsersScreen(),
        '/iletisim': (context) => iletisim(),
      },
      initialRoute: '/login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
        useMaterial3: true,
      ),
    );
  }
}
