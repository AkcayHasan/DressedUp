import 'package:dressed_up/core/components/custom_button.dart';
import 'package:dressed_up/core/components/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool keepSignedIn = false;
  bool isLoading = false;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Login",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text("Welcome back to the app",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Email Address",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            CustomEditText(
                hintText: "Email Address", controller: emailController),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Password",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                    // TODO: Remove default bottom padding
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text("Forgot Password?",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff2F4EFF),
                                fontWeight: FontWeight.bold)))
                  ]),
            ),
            CustomEditText(
                hintText: "Password", controller: passwordController),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: keepSignedIn,
                      shape: const CircleBorder(),
                      activeColor: const Color(0xff2F4EFF),
                      onChanged: (value) {
                        setState(() {
                          keepSignedIn = value!;
                        });
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text('Keep me signed in'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CustomButton(
                  text: "Login",
                  onPressed: () {
                    setState(() => isLoading = true);
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() => isLoading = false);
                      // ignore: use_build_context_synchronously
                      if (mounted) context.push("/register");
                    });
                  },
                  color: const Color(0xff2F4EFF),
                  textColor: Colors.white,
                  icon: isLoading
                      ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Icon(Icons.account_box, color: Colors.white)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or sign in with',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const CustomButton(
              text: "Continue with Google",
              color: Colors.grey,
              textColor: Color(0xff4B5768),
              icon: Icon(Icons.g_mobiledata_rounded),
            ),
            const SizedBox(height: 30,),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Create an account',
                  style: TextStyle(color: Color(0xff2F4EFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
