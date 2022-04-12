import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multipurpose_security_system/FlamesListPage.dart';
import 'package:multipurpose_security_system/GasListPage.dart';
import 'package:multipurpose_security_system/MainDrawer.dart';
import 'package:multipurpose_security_system/Model/CommonClass.dart';
import 'package:multipurpose_security_system/Model/Dashboard/DashboardApi.dart';
import 'package:multipurpose_security_system/PersonCountListPage.dart';
import 'package:multipurpose_security_system/SmokeListPage.dart';
import 'package:multipurpose_security_system/TemperatureListPage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with TickerProviderStateMixin {
  bool _isLoading = false;
  DateTime backbuttonpressedTime;
  DashboardApi dashBoardApi;
  CommonClass commonClass;

  @override
  void initState() {
   _isLoading=true;
    dashboard();
    super.initState();
  }



  dashboard()async {
    final response = await http.get(
       'https://securitsys.000webhostapp.com/flutterdata/dashboardapi.php');
    dashBoardApi = new DashboardApi.fromJsonMap(json.decode(response.body.toString()));
    if(response.statusCode == 200) {
      if (dashBoardApi != null) {
        setState(() {
          _isLoading = false;
        });

        print(response.body);
        return dashBoardApi;
      }
    }else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }

  }


  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    //Statement 1 Or statement2
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);
    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
        msg: "Please click BACK again to exit",
      );
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFddfffb),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:Color(0xFF00ddc1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title:Text('Dashboard',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
        actions: <Widget>[
          // IconButton(icon: Icon(Icons.notifications),color:Color(0xFFeec05a),iconSize: 30,
          //   onPressed:(){},
          // ),
          SizedBox(width: 10,),
        ],
      ),
      drawer:  MainDrawer(),
      body:  _isLoading ? Center(child: CircularProgressIndicator()) :WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context){
                                  return FlamesListPage();
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
                            color: Color(0xFF00b4bc),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Container(
                                  alignment:Alignment.center,
                                  width: 60,
                                  height: 60,
                                  child: new Image.asset('assets/images/flame.png',fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Flame"+": " + dashBoardApi.flame,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)
                                  ),
                                ),
                                SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context){
                                  return GasListPage();
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color: Color(0xFF00b4bc),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Container(
                                  alignment:Alignment.center,
                                  width: 60,
                                  height: 60,
                                  child: new Image.asset('assets/images/gas.png',fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Gas"+": " + dashBoardApi.gas,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)
                                  ),
                                ),
                                SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context){
                                  return SmokeListPage();
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            color: Color(0xFF00b4bc),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Container(
                                  alignment:Alignment.center,
                                  width: 60,
                                  height: 60,
                                  child: new Image.asset('assets/images/carbon-dioxide.png',fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Smoke"+": " + dashBoardApi.smoke,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)
                                  ),
                                ),
                                SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context){
                                  return TemperatureListPage();
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
                            color: Color(0xFF00b4bc),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Container(
                                  alignment:Alignment.center,
                                  width: 60,
                                  height: 60,
                                  child: new Image.asset('assets/images/thermometer.png',fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Temperature"+": " + dashBoardApi.temperature,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)
                                  ),
                                ),
                                SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 140,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context){
                                  return PersonCountListPage();
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),

                            ),
                            color: Color(0xFF00b4bc),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Container(
                                  alignment:Alignment.center,
                                  width: 60,
                                  height: 60,
                                  child: new Image.asset('assets/images/group.png',fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text("Person Count"+": " + dashBoardApi.count,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)
                                  ),
                                ),
                                SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        )
      ),
    );
  }
}