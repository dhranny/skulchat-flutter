import 'package:flutter/material.dart';
import '../utils/httpRester.dart' as rest;
import '../models/userModel.dart';

class RegisterUi extends StatefulWidget{
  @override
  State<RegisterUi> createState() {
    return RegisterUiState();
  }


}

class RegisterUiState extends State<RegisterUi>{
  final _nameController = TextEditingController();
  final _gmailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Colors.black12
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 8.8 / 10,
                  minHeight: MediaQuery.of(context).size.height * 7 / 10,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('images/chatimg.png')),
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: const Text('Skul Chat',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text('Welcome to our school message app\nI hope you will find what you are looking for!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, bottom: 10),
                        child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              hintText: 'Joe Doe',

                            ),
                            keyboardType: TextInputType.name,
                            maxLines: 1,
                            controller: _nameController
                        ),
                      ),
                      TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                            hintText: 'joe.doe@gmail.com',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          controller: _gmailController
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                hintText: '***********',
                                suffixIcon: Icon(Icons.visibility, color: Theme.of(context).primaryColor,)
                            ),
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            maxLines: 1,
                            controller: _passController
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          rest.login(User(_nameController.text, _passController.text, _gmailController.text));
                        },
                        child: Text('Sign In', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        )),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            minimumSize: Size(double.infinity, 50)
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an account?', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
                      GestureDetector(onTap: (){
                        Navigator.pushNamed(context, '/login');
                      },
                          child: Text('Log in', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500, color: Colors.deepOrangeAccent))
                      )
                    ],
                  )
              )
            ],
          ),
        )
    );
  }

}