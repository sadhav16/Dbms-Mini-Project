import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {

  final void Function()? onTap;

  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswdController = TextEditingController();
  final TextEditingController confirmpswdController = TextEditingController();

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

            const SizedBox(height: 15), 
            //confirm pswd
             MyTextfield(
              controller: confirmpswdController,
              hinText: "confirm password",
              obscureText: true,
            ),

            const SizedBox(height: 25),
            //sign in button
            MyButton(
              onTap: (){}, 
              text: "Sign Up"
            ),

            const SizedBox(height: 25),
            //Already a member
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?", 
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
                    "login now" , 
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