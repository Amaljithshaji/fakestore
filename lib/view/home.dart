import 'package:fakestore/controller/controller.dart';
import 'package:fakestore/view/adduser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    Provider.of<Controller>(context,listen: false).fetchdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    final homeController = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('update user',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: false,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: Text('Users',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
          Container(
            width: double.infinity,
            height: 600,
            
            child: ListView.builder(itemCount: homeController.responsedata.length,
              itemBuilder: (context,index)=> Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(leading: Text(homeController.responsedata[index].username.toString()),
              title: Text(homeController.responsedata[index].password.toString()),)
            ) ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Adduser()));
          }, child: Text('Add user'))
        ],
      ),
    );
  }

}