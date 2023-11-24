import 'dart:convert';


import 'package:flutter/material.dart';

import '../model/models.dart';
import 'package:http/http.dart' as http;

class Controller extends ChangeNotifier{
 List<Apimodel> responsedata = [];
 

  
  
  Future<void> fetchdata()async{
    final url = Uri.parse('https://fakestoreapi.com/users');
    final response = await http.get(url);
    if(response.statusCode == 200){
     
      print(response.body);
      final List<dynamic> userJsonList = json.decode(response.body);
      responsedata = userJsonList.map((json) => Apimodel.fromJson(json)).toList();
      notifyListeners();
    }else{
      print('failed to loa data');
    }
    notifyListeners();
  } 
   adddata({required String username, required String email,required String password ,required String phone}) async {
   
   
    final url = Uri.parse('https://fakestoreapi.com/users');
    final response = await http.post(url, body: jsonEncode({
       "email": email,
        "username": username,
        "password": password,
         "phone": phone,
         }), headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
     SnackBar(content: Text('data added successfully'),);
      print(response.body);
       return Apimodel.fromJson(json.decode(response.body));
    }
    {
      SnackBar(content: Text('failed to add data'));
    }
    fetchdata();
    notifyListeners();
  }

}
