import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:multipurpose_security_system/HomePage.dart';
import 'package:multipurpose_security_system/SignUpPage.dart';
import 'file:///F:/AndroidProjects/InfoLab/multipurpose_security_system/lib/Model/Login/LoginApi.dart';
import 'package:multipurpose_security_system/widgets/CustomTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool isLoggedIn = false;
  final formKey = new GlobalKey<FormState>();
  String token;
  LoginApi userLoginAPi;


  @override
  void initState(){
    super.initState();
  }

  login(String Email, Password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': Email,
      'password': Password
    };

    var response = await http.post("https://securitsys.000webhostapp.com/flutterdata/login.php", body: data);
    userLoginAPi = new LoginApi.fromJsonMap(json.decode(response.body.toString()));
    if(response.statusCode == 200) {
      if (!userLoginAPi.error) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("user_Id",userLoginAPi.user.l_id);
        print(response.body);
        Fluttertoast.showToast(
            msg: userLoginAPi.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => HomePage()), (
            Route<dynamic> route) => false);
      }else{
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
            msg: userLoginAPi.message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2
        );
        print(response.body);
      }
    }else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  Color(0xFFddfffb),
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              headerSection(),
              textSection(),
              buttonSection(),
            ],
          ),
        ),
      ),
    );
  }

  Container buttonSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            child :MaterialButton(
              height: 50.0,
              minWidth: MediaQuery.of(context).size.width/2.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed:_submit,
              child: Text('Continue'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),),
              color: Color(0xFF00b4bc),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 18
              ),
              child: FlatButton(
                child: Text('Don\'t have an Account? SignUp',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                }
              ),),
          ),
        ],
      ),
    );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: CustomTextField(
                errorMsg: 'Please enter Email',
                keyboardType: TextInputType.emailAddress,
                textEditingController: emailController,
                icon: Icons.email,
                hint: "Email",
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child : CustomTextField(
                errorMsg: 'Please enter password',
                keyboardType: TextInputType.text,
                textEditingController: passwordController,
                icon: Icons.lock,
                obscureText: true,
                hint: "Password",
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Container headerSection() {
    return Container(
        alignment: Alignment.center,
        child: Column(
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                child: new Image.asset('assets/images/security.png'),
              ),
              SizedBox(height: 20,),
              Container(
                child :MaterialButton(
                  height: 45.0,
                  minWidth: MediaQuery.of(context).size.width/2.5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  onPressed:(){},
                  child: Text('Login'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  color: Color(0xFF00ddc1),
                ),
              ),] ));
  }
  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        _isLoading = true;
      });
      login(emailController.text, passwordController.text);
    }
  }
}