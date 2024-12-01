// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class LoginPage extends StatefulWidget {
  final VoidCallback showSignupPage;
  const LoginPage({Key?key,required this.showSignupPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future Login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );
  }
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body:
      Container( decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Untitled.png'), // Path to your image
            fit: BoxFit.cover, // Makes the image cover the entire screen
          ),
        ),
        child: SafeArea(
          
          child: 
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //metasphere
               
                const Text(
                  "Metasphere",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  ),
                    const SizedBox(height:10),
               
                   const Text(
                  "Login",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                  ),
                  const  SizedBox(height:50),
                    //email text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                     
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                             controller: _emailController,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //password textfield
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                //login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: Login,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color:Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                       ),
                      child: Center (
                        child: 
                        Text('Login',
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ),
                        )
                       
                    ),
                         
                                  ),
                  )
                ),
                 const SizedBox(height:25),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Not a user?',style: TextStyle(
                      fontWeight: FontWeight.bold
                     ),),
                     GestureDetector(
                      onTap: widget.showSignupPage,
                       child: Text(' Signup',style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                       ),
                       ),
                     ),
                   ],
                 ),
              ],
                ),
          ),
        ),
            ),
      ),
      );
  }
}