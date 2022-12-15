import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/screen/screen_forgot_pass.dart';
import 'package:smart/screen/screen_registration.dart';
import 'package:http/http.dart' as http;
import 'package:smart/widgets/helper.dart';

class screen_login extends StatefulWidget {
  const screen_login({Key? key}) : super(key: key);

  @override
  State<screen_login> createState() => _screen_loginState();
}

class _screen_loginState extends State<screen_login> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Signin into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: helper().inputbox(
                                      'Phone No', 'Enter your Phone No'),
                                ),
                                decoration: helper().boxshaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: helper().inputbox(
                                      'Password', 'Enter your password'),
                                ),
                                decoration: helper().boxshaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordPage()),);
                                  },
                                  child: Text("Forgot your password?",
                                    style: TextStyle(color: Colors.grey,),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            screen_registration()),);
                                  },
                                  child: Text("Sign UP",
                                    style: TextStyle(color: Colors.grey,),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: helper().buttonBoxDecoration(
                                    context),
                                child: ElevatedButton(
                                  style: helper().buttonStyle(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text('Sign In'.toUpperCase(),
                                      style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),),
                                  ),
                                  onPressed: () {
                                    login();
                                                },
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> login()async {
    if (phoneController.text.isEmpty && passwordController.text.isEmpty) {
      var response =  await http.post(Uri.parse('https://smartwashvklm.com/api/login'), body: ({
        'phone':phoneController.text ,
        'password':passwordController.text
      }));
      if(response.statusCode==200){

      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid')));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Faild')));
    }
  }
}
