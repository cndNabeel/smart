import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smart/widgets/helper.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
                child: Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Forgot Password?',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text('Enter the email address associated with your account.',
                                style: TextStyle(
                                  // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text('We will email you a verification code to check your authenticity.',
                                style: TextStyle(
                                  color: Colors.black38,
                                  // fontSize: 20,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Form(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  decoration:helper().inputbox("Email", "Enter your email"),
                                ),
                                decoration: helper().boxshaddow(),
                              ),
                              SizedBox(height: 40.0),
                              Container(
                                decoration: helper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                    style: helper().buttonStyle(),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 10, 40, 10),
                                      child: Text(
                                        "Send".toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {

                                    }
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}