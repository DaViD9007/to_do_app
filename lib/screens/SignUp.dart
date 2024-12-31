import 'package:flutter/material.dart';
import 'package:to_do_app/const/colours.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback show;
  const SignupScreen(this.show,{super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3  = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {
      });
    });
    super.initState();
    _focusNode2.addListener((){
      setState(() {
      });
    });
    super.initState();
    _focusNode3.addListener((){
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20),
          image(),
          SizedBox(height: 50),
          textField(email, _focusNode1, 'Email', Icons.email),
          SizedBox(height: 10),
          textField(password, _focusNode2, 'Password', Icons.password),
          SizedBox(height: 10),
          textField(password, _focusNode3, 'Confirm password', Icons.password),
          SizedBox(height: 8),
          account(),
          signupBottom()
        ]),
      )));
  }

  Padding account() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Do you have an account?",
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              SizedBox(width: 5),
              GestureDetector(
                onTap: widget.show,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
          );
  }

  Padding signupBottom() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: customGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Sign up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
  }

  Widget textField(TextEditingController controller, FocusNode focusNode, String typeName, IconData iconss) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  iconss,
                  color: focusNode.hasFocus ? customGreen: Colors.grey,
                ),
                contentPadding: 
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                hintText: typeName,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: customGreen,
                    width: 2.0,
                  ),
                )            
              ),
            ),
          ),
        );
  }

  Widget image() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/img1.jpg'),
              fit: BoxFit.cover,
            )),
          ),
        );
  }
}
