//Burası kullanıcının müzik kütüphanesi

import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  const Library({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kütüphane"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSongEntry(
                  "Never Stop", "Calvin Quinn", "assets/images1/music1.jpg"),
              SizedBox(height: 16), 
              buildSongEntry(
                  "Crazy Robbery", "Phillip Zeta", "assets/images1/music2.jpg"),
              SizedBox(height: 16),
              buildSongEntry(
                  "Dzieki", "Lukasz Rabszyje", "assets/images1/music4.jpg"),
              SizedBox(height: 16),
              buildSongEntry(
                  "Ice Rocks", "Group Union", "assets/images1/music3.jpg"),
              SizedBox(height: 16),
              buildSongEntry(
                  "Marriage", "Claudio Albertini", "assets/images1/music7.jpg"),
              SizedBox(height: 16),
              buildSongEntry("One Week in Scary Museum", "Adriana Ferguson",
                  "assets/images1/music6.jpg"),
              SizedBox(height: 16),
              buildSongEntry(
                  "Taxi", "Marc Sanchez", "assets/images1/music5.jpg"),
              SizedBox(height: 16),
              buildSongEntry(
                  "Toy Story", "Ilian Roberts", "assets/images1/music8.jpg"),
              SizedBox(height: 16),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSongEntry(String title, String artist, String imageAsset) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageAsset, width: 72),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  artist,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
