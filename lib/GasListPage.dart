import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multipurpose_security_system/Model/Gas/GasListApi.dart';

class GasListPage extends StatefulWidget {
  @override
  _GasListPageState createState() => _GasListPageState();
}

class _GasListPageState extends State<GasListPage> {
  bool _isLoading = false;
  GasListApi gasListApi;

  Future<List<dynamic>> getGas() async {

    final response = await http.get(
      'https://securitsys.000webhostapp.com/flutterdata/mq4gassensordata.php',
    );
    gasListApi = new GasListApi.fromJsonMap(json.decode(response.body.toString()));
    if(response.statusCode == 200) {
      if (response != null) {
        setState(() {
          _isLoading = false;
        });

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
  void initState() {
    _isLoading=true;
    getGas();
    super.initState();
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
              Text("Gas",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
            ],
          ),
        ),
        body:  _isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          shrinkWrap: true,
          itemCount: gasListApi.gas.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xFF00b4bc),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child:  Text("CNG_VALUE:",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Expanded(
                            flex: 1,
                            child:  Text(gasListApi.gas[index].mq4_value),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child:  Text("READING_TIME: ",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Expanded(
                            flex: 1,
                            child:  Text(gasListApi.gas[index].reading_time),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
