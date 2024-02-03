//İletişim kısmında kullanıcının telefon ve e posta bilgileri gösterilir

import 'package:flutter/material.dart';
import 'package:ytmusic_sample/widgets/menuItem.dart';
import 'package:ytmusic_sample/widgets/profileItem.dart';

class iletisim extends StatefulWidget {
  const iletisim({super.key});

  @override
  State<iletisim> createState() => _iletisimState();
}

class _iletisimState extends State<iletisim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfileItem(
              avatar: 'assets/images1/eb.jpg',
              name: 'Emirhan Barış',
            ),
            Divider(),
            MenuItem(
                icon: Icon(Icons.email),
                title: "emirhanb16@live.com",
                onTap: () {}),
            Divider(),
            MenuItem(
                icon: Icon(Icons.phone),
                title: "+90 534 333 99 55",
                onTap: () {}),
            Divider(),
            MenuItem(icon: Icon(Icons.topic), title: "Öğrenci", onTap: () {}),
            Divider(),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text("Geri dön"),
            ),
          ],
        ),
      ),
    );
  }
}
