//Burası müzik uygulamasının giriş ekranı burada bazı şarkılar ve yanda üç çizgi şeklinde menü vardır.Bu menüden ayarlar kullanıcılar gibi yerlere gidebilirsiniz

import 'package:flutter/material.dart';
import 'package:ytmusic_sample/widgets/menuItem.dart';

import 'package:ytmusic_sample/widgets/profileItem.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YT Music"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ProfileItem(
                avatar: 'assets/images1/eb.jpg',
                name: 'Emirhan Barış',
                onTap: () {
                  Navigator.pushNamed(context, "/profile");
                }),
            Expanded(
              child: Column(
                children: [
                  Divider(),
                  MenuItem(
                    title: "Ana Ekran",
                    icon: Icon(
                      Icons.home,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  MenuItem(
                    title: "İletişim",
                    icon: Icon(
                      Icons.message,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/iletisim');
                    },
                  ),
                  Divider(),
                  MenuItem(
                    title: "Hakkımızda",
                    icon: Icon(
                      Icons.info_outline,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  MenuItem(
                    title: "Kütüphane",
                    icon: Icon(
                      Icons.library_music,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/library');
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  MenuItem(
                    title: "Ayarlar",
                    icon: Icon(
                      Icons.settings,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/settings");
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  MenuItem(
                    title: "Kullanicilar",
                    icon: Icon(
                      Icons.person,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/usersScreen");
                    },
                  ),
                  MenuItem(
                    icon: Icon(Icons.logout_outlined),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    title: "oturumu kapat",
                  ),
                ],
              ),
            ),
            Text(
              "Version 1.0.7",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(62, 36, 17, 1),
                  const Color.fromRGBO(48, 14, 32, 1),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images1/ytmusiclogo.png", width: 30),
                    SizedBox(width: 5),
                    Text(
                      'Music',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.podcasts, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images1/eb.jpg"),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EnergizeItem(label: "Energize"),
              EnergizeItem(label: "Workout"),
              EnergizeItem(label: "Feel Good"),
              EnergizeItem(label: "Relaxation"),
              EnergizeItem(label: "Chill Out"),
              EnergizeItem(label: "Rock"),
              EnergizeItem(label: "Pop"),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "START RADIO FROM A SONG",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quick Picks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3.0,
                                bottom: 3,
                                right: 9,
                                left: 9,
                              ),
                              child: Text(
                                "Play all",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // Örnekler oluşturmak için MusicItem widget'ını kullanın
                      MusicItem(),
                      MusicItem2(),
                      MusicItem3(),
                      MusicItem4(),
                      MusicItem5(),
                      MusicItem6(),
                      MusicItem7(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomNavigationBarItem(Icons.home, "Home"),
                  _buildBottomNavigationBarItem(Icons.fast_forward, "Samples"),
                  _buildBottomNavigationBarItem(Icons.explore, "Explore"),
                  _buildBottomNavigationBarItem(Icons.library_music, "Library"),
                  _buildBottomNavigationBarItem(Icons.play_circle, "Upgrade"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        Text(text, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class EnergizeItem extends StatelessWidget {
  final String label;

  const EnergizeItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 12, right: 12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(47, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(47, 255, 255, 255),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class MusicItem extends StatelessWidget {
  const MusicItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music1.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Never Stop",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Calvin Quinn",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MusicItem2 extends StatelessWidget {
  const MusicItem2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music2.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bad Chance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Mario Santos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MusicItem3 extends StatelessWidget {
  const MusicItem3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music3.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dzieki",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Łukasz Rabzsyje",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MusicItem4 extends StatelessWidget {
  const MusicItem4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music4.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What a Planet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kevin Greening",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MusicItem5 extends StatelessWidget {
  const MusicItem5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music5.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Crazy Robbery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Phillip Zeta",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MusicItem6 extends StatelessWidget {
  const MusicItem6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music6.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mentira Mundo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Marc Sanchez",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class MusicItem7 extends StatelessWidget {
  const MusicItem7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ), 

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images1/music7.jpg", width: 72),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What the Planet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Gareth Earner",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
