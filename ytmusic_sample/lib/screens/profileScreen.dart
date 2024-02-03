//Burada kullanıcıların favori müzik ve istatistikleri bulunur.

import 'package:flutter/material.dart';
import 'package:ytmusic_sample/widgets/menuItem.dart';

import '../widgets/profileItem.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

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
                icon: Icon(Icons.play_circle),
                title: "Son 1 ayda 7440 dk müzik dinleme",
                onTap: () {}),
            Divider(),
            MenuItem(
                icon: Icon(Icons.person), title: "339 takipçi", onTap: () {}),
            Divider(),
            MenuItem(
                icon: Icon(Icons.music_note),
                title: "Favori Şarkı:Phillip Zeta-Crazy Robbery",
                onTap: () {}),
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
