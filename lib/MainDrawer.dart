import 'package:flutter/material.dart';
import 'package:multipurpose_security_system/FlamesListPage.dart';
import 'package:multipurpose_security_system/GasListPage.dart';
import 'package:multipurpose_security_system/HomePage.dart';
import 'package:multipurpose_security_system/PersonCountListPage.dart';
import 'package:multipurpose_security_system/SmokeListPage.dart';
import 'package:multipurpose_security_system/TemperatureListPage.dart';
import 'package:multipurpose_security_system/WarningPage.dart';
import 'package:multipurpose_security_system/widgets/exit_confirmation_dialog.dart';
class MainDrawer extends StatelessWidget {
  // final String image;
  // final String name;
  // final String email;
  // MainDrawer({this.image,this.name,this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Color(0xFF00ddc1),
                margin: EdgeInsets.only(top: 25,bottom: 10),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color:Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/security.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                    //  Text("Online Beej",style: TextStyle(fontSize: 22,color: Colors.white),),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()), (
                            Route<dynamic> route) => false);
                      },
                      leading: Icon(Icons.home,color: Color(0xFF00ddc1),),
                      title: Text('Home',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return FlamesListPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(Icons.local_fire_department_sharp,color: Color(0xFF00ddc1),),
                      title: Text('Flames',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return GasListPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(Icons.fire_extinguisher,color: Color(0xFF00ddc1),),
                      title: Text('Gas',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return SmokeListPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(Icons.smoke_free,color: Color(0xFF00ddc1),),
                      title: Text('Smoke',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return TemperatureListPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(Icons.thermostat_outlined,color: Color(0xFF00ddc1),),
                      title: Text('Temperature',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return PersonCountListPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(Icons.people_alt_rounded,color: Color(0xFF00ddc1),),
                      title: Text('PersonCount',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context){
                              return WarningPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(Icons.warning,color: Color(0xFF00ddc1),),
                      title: Text('Warning',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
                    ),
                    ListTile(
                      onTap: (){
                        showDialog(context: context, builder: (context) => ExitConfirmationDialog());
                      },
                      leading: Icon(Icons.exit_to_app,color: Color(0xFF00ddc1),),
                      title: Text('Logout',
                        style: TextStyle(
                            fontSize: 16,color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Divider(thickness: 1,),
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