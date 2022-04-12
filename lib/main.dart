import 'package:flutter/material.dart';
import 'package:multipurpose_security_system/HomePage.dart';
import 'package:multipurpose_security_system/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
  theme:
  ThemeData(primaryColor: Colors.white,accentColor: Color(0xFF00b4bc)),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
)
);

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Animation<double> opacity;
  AnimationController controller;

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('user_Id') != null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen()), (
          Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    opacity = Tween<double>(begin: 0.2, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      checkLoginStatus();
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFf1fffd)),
      child: SafeArea(
        child: new Scaffold(
          backgroundColor: Color(0xFFddfffb) ,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Opacity(
                        opacity: opacity.value,
                        child: Padding(
                          padding: const EdgeInsets.all(36),
                          child: new Image.asset(
                            'assets/images/security.png',
                            height: 250,width: 250,),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('MULTIPURPOSE SECURITY SYSTEM',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
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
