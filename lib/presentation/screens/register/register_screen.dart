import 'package:dressed_up/core/components/custom_button.dart';
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
  bool _isObscure = true;

  get textColor => null;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create An Account",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text("Welcome back to the app",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text("Username",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            CustomEditText(hintText: "Username", controller: emailController),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
              child: Text("Email Address",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            CustomEditText(
                hintText: "Email Address", controller: emailController),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
              child: Text("Password",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            CustomEditText(
              hintText: "Password",
              controller: emailController,
              suffixIcon: Icons.visibility,
              obscureText: _isObscure,
              toggleVisibility: _toggleVisibility,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: CustomButton(
                  text: "Sign up",
                  onPressed: () {
                    context.go("/main");
                  },
                  color: const Color(0xff2F4EFF),
                  textColor: Colors.white),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0)),
                      child: const Text(
                        "Sign in here",
                        style: TextStyle(
                            color: Color(0xff2F4EFF),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
