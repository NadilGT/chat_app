import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/pages/search_page.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/shared/constants.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();

  }

  gettingUserData()async{
    await HelperFunction.getUserEmailFromSF().then((value){
      setState(() {
        email = value!;
      });
    });
    await HelperFunction.getUserNameFromSF().then((val){
      setState(() {
        userName = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Groups",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(context, SearchPage());
            },
            icon: Icon(Icons.search),
            color: Colors.white,
            iconSize: 25,
          ),
        ],
        backgroundColor: Constants().primaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(Icons.account_circle,size: 150,color: Colors.grey,),
            SizedBox(height: 15,),
            Text(email)
          ],
        ),
      ),
    );
  }
}
