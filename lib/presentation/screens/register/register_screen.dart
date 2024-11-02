import 'package:dressed_up/core/components/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  get textColor => null;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          context.pop();
        }, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create An Account", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text("Welcome back to the app", style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20.0),
            const Padding(padding: EdgeInsets.only(bottom: 10), child: Text("Email Address", style: TextStyle(fontSize: 16, color: Colors.black)),),
            CustomEditText(hintText: "Email Address", controller: emailController),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Password", style: TextStyle(fontSize: 16, color: Colors.black)),
                  // TODO: Remove default bottom padding
                  TextButton(
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ), 
                  child: const Text(
                    "Forgot Password?", 
                    style: TextStyle(
                      fontSize: 12, 
                      color: Color(0xff2F4EFF), 
                      fontWeight: FontWeight.bold
                    )
                  )
                  )
                ]
              ),
            ),
            CustomEditText(hintText: "Password", controller: emailController),
            
          ],
        ),
      ),
    );
  } 
}