//Ayarlar kısmında güncellemeniz gereken ayarlar.Verileri kaydetmeniz mümkündür.Sıfırlamanız da öyle.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SharedPreferences _prefs;
  bool isDataSavingEnabled = false;
  bool isListenOnly = false;
  bool isMonoAudio = false;
  bool isBassEnabled = true;
  bool isEqualizerEnabled = true;
  bool isskipsilenceEnabled = true;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences(); // SharedPreferences'i başlat
  }

  _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    readData();
  }

  readData() {
    setState(() {
      isDataSavingEnabled = _prefs.getBool('dataSavingEnabled') ?? false;
      isListenOnly = _prefs.getBool('listenOnly') ?? false;
      isMonoAudio = _prefs.getBool('monoAudio') ?? false;
      isBassEnabled = _prefs.getBool('bassEnabled') ?? true;
      isEqualizerEnabled = _prefs.getBool('equalizerEnabled') ?? true;
      isskipsilenceEnabled = _prefs.getBool('skipsilenceEnabled') ?? true;
    });
  }

  storeData() async {
    await _prefs.setBool('dataSavingEnabled', isDataSavingEnabled);
    await _prefs.setBool('listenOnly', isListenOnly);
    await _prefs.setBool('monoAudio', isMonoAudio);
    await _prefs.setBool('bassEnabled', isBassEnabled);
    await _prefs.setBool('equalizerEnabled', isEqualizerEnabled);
    await _prefs.setBool('skipsilenceEnabled', isskipsilenceEnabled);
  }

  clearDataIOS() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12),
            Text("Confirmation"),
          ],
        ),
        content: Text("Are you sure you want to clear all the data?"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              _prefs = await SharedPreferences
                  .getInstance(); // SharedPreferences'i güncelle
              await _prefs.clear();
              readData(); // Verileri tekrar oku ve setState çağır
            },
            child: Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("No"),
          ),
        ],
      ),
    );
  }

  clearData() async {
    if (isDataSavingEnabled ||
        isListenOnly ||
        isMonoAudio ||
        isBassEnabled ||
        isEqualizerEnabled ||
        isskipsilenceEnabled) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning),
              Gap(12),
              Text("Confirmation"),
            ],
          ),
          content: Text("Are you sure you want to clear all the data?"),
          actions: [
            ElevatedButton(
              onPressed: () async {
                _prefs = await SharedPreferences.getInstance();
                await _prefs.clear();
                readData();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Yes"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("No"),
            ),
          ],
        ),
      );
    } else {
      // If none of the checkboxes are checked, clear the data directly
      _prefs = await SharedPreferences.getInstance();
      await _prefs.clear();
      readData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              clearData();
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              storeData();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Settings Saved"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.fixed,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images1/eb.jpg'),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/profile");
                  },
                  child: Text(
                    'emirhanb16\nProfili Görüntüle',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 8, 13, 56),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Switches and Checkboxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data Saving Enabled',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: isDataSavingEnabled,
                  onChanged: (value) {
                    setState(() {
                      isDataSavingEnabled = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Listen Only',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: isListenOnly,
                  onChanged: (value) {
                    setState(() {
                      isListenOnly = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mono Audio',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: isMonoAudio,
                  onChanged: (value) {
                    setState(() {
                      isMonoAudio = value;
                    });
                  },
                ),
              ],
            ),
            Divider(),
            Text(
              "Bass",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bass Enabled',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Checkbox(
                  value: isBassEnabled,
                  onChanged: (value) {
                    setState(() {
                      isBassEnabled = value ?? false;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Equalizer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Checkbox(
                  value: isEqualizerEnabled,
                  onChanged: (value) {
                    setState(() {
                      isEqualizerEnabled = value ?? false;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skip the silence',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Checkbox(
                  value: isskipsilenceEnabled,
                  onChanged: (value) {
                    setState(() {
                      isskipsilenceEnabled = value ?? false;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
