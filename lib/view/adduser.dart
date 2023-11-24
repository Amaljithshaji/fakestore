import 'package:fakestore/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
   final _nameController =TextEditingController();
  final _emailController =TextEditingController();
  final _phoneController =TextEditingController();
  final _passController =TextEditingController();
  @override
  void initState() {
     Provider.of<Controller>(context,listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _addController = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add user'),
      ),
      body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'name',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'phone',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Center(child: ElevatedButton(onPressed: ()async {
              try {
                await _addController.adddata(username: _nameController.text,
                 email: _emailController.text, password: _passController.text, phone: _phoneController.text);

               
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('User added successfully'),
                    duration: Duration(seconds: 2),
                  ),
                );
                await _addController..fetchdata();
              } catch (e) {
               
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error adding user: $e'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            }, child: Text('save')))
            ],

          ),
    );
  }
  
  }
