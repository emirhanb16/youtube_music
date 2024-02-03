// Burası login screen.Buraya kaydolmadan girerseniz uygulamaya giriş yapamazsınız.Bu kod yapısı responsivedir.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ytmusic_sample/screens/service/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with AutomaticKeepAliveClientMixin<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;
  String errorMessage = "";

  login() async {
    setState(() {
      loading = true;
      errorMessage = "";
    });

    API api = API();

    try {
      final response = await api.login(
        username: emailController.text,
        password: passwordController.text,
      );

      // Yanıtı kontrol edin ve buna göre işlem yapın
      if (response is Exception) {
        setState(() {
          errorMessage =
              "Invalid email or password"; 
        });
      } else {
        // Başarılı bir şekilde giriş yapıldı, yanıtı buradan halledebilirsiniz
         // Şimdi girilen e-posta ve şifrenin kayıtla eşleşip eşleşmediğini kontrol edin
         // kayıt sırasında SharedPreferences'ta saklanan veriler

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String registeredEmail = prefs.getString('email') ?? "";
        String registeredPassword = prefs.getString('password') ?? "";

        if (emailController.text == registeredEmail &&
            passwordController.text == registeredPassword) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (Route<dynamic> route) => false,
          );
        } else {
          setState(() {
            errorMessage = "Invalid email or password";
          });
        }
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: "),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(49, 158, 158, 158),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration:
                          InputDecoration(hintText: "Enter your email address"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Password:"),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(49, 158, 158, 158),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: "Enter your password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  if (errorMessage.isNotEmpty)
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            login();
                          }
                        },
                        child: Text("Login"),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
