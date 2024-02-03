//Burada bazı kullanıcıların favori şarkıları yer almakta.Sayfa geçişi widgeti de mutlaka bulunmaktadir

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'service/api.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  bool loading = false;
  int currentPage = 1;
  int totalPages = 1;
  List<dynamic> users = [];

  loadUsers({int page = 1}) async {
    try {
      if (page < 1 || page > totalPages) {
        return;
      }

      setState(() {
        loading = true;
      });

      API api = API();
      var result = await api.getUsers(page: page);

      if (result is Exception) {
        showError(context);
      } else {
        setState(() {
          currentPage = result["page"];
          totalPages = result["total_pages"];

          if (page == 1) {
            
            users = result["data"];
          } else {
            
            users = result["data"]
                .where((user) =>
                    "${user["first_name"]} ${user["last_name"]}" == "Michael Lawson" ||
                    "${user["first_name"]} ${user["last_name"]}" ==
                        "Bryon Fields" ||
                    "${user["first_name"]} ${user["last_name"]}" ==
                        "George Edwards" ||
                    "${user["first_name"]} ${user["last_name"]}"
                            .compareTo("Michael Lawson") >
                        0)
                .toList();
          }

          loading = false;
        });
      }
    } catch (e) {
      print("Error loading users: $e");
      showError(context);
      setState(() {
        loading = false;
      });
    }
  }

  List<Widget> drawUsers() {
    List<Widget> userList = [];

    for (var element in users) {
      userList.add(UserTile(element: element));
    }

    return userList;
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  showError(BuildContext context) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning),
            Gap(12.0),
            Text("Error"),
          ],
        ),
        content: Text("Check your internet connection and try again"),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Ok"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users and Favorite Songs"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (loading) LinearProgressIndicator(),
              if (!loading) ...drawUsers(),
              Container(
                margin: EdgeInsets.all(12.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (currentPage > 1) {
                          loadUsers(page: currentPage - 1);
                        }
                      },
                      child: Icon(Icons.arrow_left_sharp,
                          color: currentPage == 1
                              ? Colors.grey.shade300
                              : Colors.black),
                    ),
                    Text("$currentPage/$totalPages"),
                    InkWell(
                      onTap: () {
                        if (currentPage < totalPages) {
                          loadUsers(page: currentPage + 1);
                        }
                      },
                      child: Icon(Icons.arrow_right_sharp,
                          color: currentPage == totalPages
                              ? Colors.grey.shade300
                              : Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.element,
  }) : super(key: key);

  final element;

  @override
  Widget build(BuildContext context) {
    
    String customText = getCustomText(element);

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(element["avatar"]),
                radius: 42,
              ),
              Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${element["first_name"]} ${element["last_name"]}"),
                  Text(element["email"]),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(customText),
        ],
      ),
    );
  }

  String getCustomText(dynamic element) {
    String firstName = element["first_name"];
    String lastName = element["last_name"];

    // İstediğiniz metinleri ekleyin
    if (firstName == "George" && lastName == "Bluth") {
      return "Favori Şarkı: Marc Sanchez - Starlight";
    } else if (firstName == "Janet" && lastName == "Weaver") {
      return " Favori Şarkı: Dzieki - Lukasz Rabszjye";
    } else if (firstName == "Emma" && lastName == "Wong") {
      return "Favori Şarkı: Mario Santos - Bad Chance";
    } else if (firstName == "Eve" && lastName == "Holt") {
      return "Favori Şarkı: Mario Santos - Bad Chance";
    } else if (firstName == "Charles" && lastName == "Morris") {
      return "Favori Şarkı: Jurrien van Bolt - Vragen";
    } else if (firstName == "Tracey" && lastName == "Ramos") {
      return "Favori Şarkı: Alejandro Hernandez - Jugador 404";
    } else if (firstName == "Michael" && lastName == "Lawson") {
      return "Favori Şarkı: Phillip Zeta - Crazy Robbery";
    } else if (firstName == "Tobias" && lastName == "Funke") {
      return "Favori Şarkı: Erik Larson - Policeman";
    } else if (firstName == "George" && lastName == "Edwards") {
      return "Favori Şarkı: Marc Sanchez - Mentira Mundo";
    } else if (firstName == "Rachel" && lastName == "Howell") {
      return "Favori Şarkı: Marc Sanchez - Starlight";
    } else {
      return "Default Custom Text"; 
    }
  }
}
