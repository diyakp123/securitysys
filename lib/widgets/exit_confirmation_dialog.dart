import 'package:flutter/material.dart';
import 'package:multipurpose_security_system/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 150,
    decoration: BoxDecoration(
        color:Color(0xFFddfffb),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
      children: <Widget>[
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.only(top:8.0,left: 12,right: 12,bottom: 8),
          child: Text('Are You Sure want to Logout?', style: TextStyle(fontSize: 18, color: Color(0xFF00ddc1), fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 24,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.clear();

                return
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()), (
                      Route<dynamic> route) => false);
              }, child: Text('Yes',style: TextStyle(fontWeight: FontWeight.bold),), color:   Color(0xFF00ddc1), textColor:Colors.white,),
            SizedBox(width: 8,),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('No',style: TextStyle(fontWeight: FontWeight.bold)),color:  Color(0xFF00ddc1), textColor: Colors.white,),
          ],
        )
      ],
    ),
  );
}