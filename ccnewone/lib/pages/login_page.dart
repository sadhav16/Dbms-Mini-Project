import 'package:ccnewone/components/my_button.dart';
import 'package:ccnewone/components/my_textfield.dart';
import 'package:ccnewone/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswdController = TextEditingController();

  // Role dropdown controller
  String? selectedRole;

  // List of roles with descriptions
  final List<Map<String, String>> rolesWithDescriptions = [
    {
      'role': 'Learner',
      'description': 'View events, register, find places and events.'
    },
    {
      'role': 'Admin',
      'description': 'Update, add events, and provide event updates.'
    },
  ];

  // login function
  void login(String email, String password) async {
    var response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/users/login/'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (!mounted) return;

    if (response.statusCode == 200) {
      // Navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      // Handle login error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
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
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // Role dropdown with description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: DropdownButtonFormField<String>(
                value: selectedRole,
                hint: Text("Select Role",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary)),
                items: rolesWithDescriptions.map((roleMap) {
                  return DropdownMenuItem<String>(
                    value: roleMap['role'],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          roleMap['role']!,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        Text(
                          roleMap['description']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                selectedItemBuilder: (BuildContext context) {
                  return rolesWithDescriptions.map((roleMap) {
                    return Text(
                      roleMap['role']!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    );
                  }).toList();
                },
              ),
            ),

            const SizedBox(height: 15),

            //email
            MyTextfield(
              controller: emailController,
              hinText: "email",
              obscureText: false,
            ),

            const SizedBox(height: 15),

            //password
            MyTextfield(
              controller: pswdController,
              hinText: "password",
              obscureText: true,
            ),

            const SizedBox(height: 25),

            //sign in button
            MyButton(
              onTap: () => login(emailController.text, pswdController.text),
              text: "Sign In",
            ),

            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a Member?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



/*
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

*/

