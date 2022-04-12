import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multipurpose_security_system/Model/Warning/WarningListApi.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class WarningPage extends StatefulWidget {
  @override
  _WarningPageState createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage>with TickerProviderStateMixin {
  bool _isLoading = false;
  DateTime backbuttonpressedTime;
  WarningListApi warningListApi;

  @override
  void initState() {
    _isLoading=true;
    warning();
    super.initState();
  }


  warning()async {
    final response = await http.get(
        'https://securitsys.000webhostapp.com/flutterdata/warning.php');
    warningListApi = new WarningListApi.fromJsonMap(json.decode(response.body.toString()));
    if(response.statusCode == 200) {
      if (warningListApi != null) {
        setState(() {
          _isLoading = false;
        });

        print(response.body);
        return warningListApi;
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
        backgroundColor: Color(0xFFddfffb),
      appBar: AppBar(
        backgroundColor:Color(0xFF00ddc1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color:Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:Row(
          children: [
            Text("Warning",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
      ),
      body:  _isLoading ? Center(child: CircularProgressIndicator()) :SingleChildScrollView(
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context){
                          //       return FlamesListPage();
                          //     },
                          //   ),
                          // );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),

                          ),
                          color:Colors.redAccent,
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
                                child: Text("Flame"+": " + warningListApi.warning[0].flame_value,
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context){
                          //       return GasListPage();
                          //     },
                          //   ),
                          // );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Colors.redAccent,
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
                                child: Text("Gas"+": " + warningListApi.warning[0].mq4_value,
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context){
                          //       return SmokeListPage();
                          //     },
                          //   ),
                          // );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Colors.redAccent,
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
                                child: Text("Smoke"+": " + warningListApi.warning[0].smoke_value,
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context){
                          //       return TemperatureListPage();
                          //     },
                          //   ),
                          // );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),

                          ),
                          color: Colors.redAccent,
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
                                child: Text("Temperature"+": " + warningListApi.warning[0].temp_value,
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (BuildContext context){
                          //       return PersonCountListPage();
                          //     },
                          //   ),
                          // );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),

                          ),
                          color: Colors.redAccent,
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
                                child: Text("Person Count"+": " + warningListApi.warning[0].count,
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
    );
  }
}