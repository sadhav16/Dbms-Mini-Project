import 'package:ccnewone/components/my_button.dart';
import 'package:ccnewone/components/my_textfield.dart';
import 'package:ccnewone/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  
  final void Function()? onTap;

  const LoginPage({super.key,required this.onTap}); 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswdController = TextEditingController();
  // login function
  void login(){
    /*
    handle the authentication part                                           backend
    */

    //navigate to home page
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => const HomePage(),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
             
            
            //message
            Text(
              "Campus Connect",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),

            const SizedBox(height: 25), 

            //email
            MyTextfield(
              controller: emailController,
              hinText: "email",
              obscureText: false,
            ),

            const SizedBox(height: 15), 
            //pswd
             MyTextfield(
              controller: pswdController,
              hinText: "password",
              obscureText: true,
            ),

            const SizedBox(height: 25),
            //sign in button
            MyButton(
              onTap: login, 
              text: "Sign In"
            ),

            const SizedBox(height: 25),
            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a Member?", 
                  style: 
                  TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                    ), 

                const SizedBox(width:4,),
                
                GestureDetector
                (
                  onTap: widget.onTap,
                  child: 
                  Text(
                    "Register" , 
                    style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    ),
                    )
                  ),
              ],
            ),

          ],
         )
        ),
    );
  }
}