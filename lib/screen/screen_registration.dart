import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart/screen/screen_login.dart';
import 'package:smart/widgets/helper.dart';
import 'package:http/http.dart' as http;

class screen_registration extends StatefulWidget {
  const screen_registration({Key? key}) : super(key: key);

  @override
  State<screen_registration> createState() => _screen_registrationState();
}

class _screen_registrationState extends State<screen_registration> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                           Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(height: 30,),
                          Container(
                            child: TextFormField(
                              controller: fullnameController,
                              decoration: helper().inputbox('Full Name', 'Enter your full name'),
                            ),
                            decoration: helper().boxshaddow(),
                          ),
                          SizedBox(height: 30,),

                          Container(
                            child: TextFormField(
                              controller: emailController,
                              decoration: helper().inputbox("E-mail address", "Enter your email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                  return "Enter a valid email address";
                                }
                                return null;
                              },
                            ),
                            decoration: helper().boxshaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: phoneController,
                              decoration: helper().inputbox(
                                  "Mobile Number",
                                  "Enter your mobile number"),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                  return "Enter a valid phone number";
                                }
                                return null;
                              },
                            ),
                            decoration: helper().boxshaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: helper().inputbox(
                                  "Password*", "Enter your password"),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              },
                            ),
                            decoration: helper().boxshaddow(),
                          ),
                          SizedBox(height: 15.0),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                    ),
                                  )
                                ],
                              );
                            },

                          ),
                          SizedBox(height: 20.0),
                          GestureDetector(
                            child : Container(
                            decoration: helper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: helper().buttonStyle(),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Register".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {

                                signUp();
                              },
                            ),
                          ),
                           ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Future<void> signUp()async {
    if (phoneController.text.isEmpty && passwordController.text.isEmpty && fullnameController.text.isEmpty) {
      var response = await http.post(Uri.parse('https://smartwashvklm.com/api/register'), body: ({
        'fullname': fullnameController,
        'email':emailController,
        'phone':phoneController.text ,
        'password':passwordController.text
      }));
      if( response.statusCode==200){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => screen_login()
            ),
                (Route<dynamic> route) => false
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid')));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Faild')));
    }
  }
}
