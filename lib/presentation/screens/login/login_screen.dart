import 'package:dressed_up/core/components/custom_button.dart';
import 'package:dressed_up/core/components/custom_edit_text.dart';
import 'package:dressed_up/presentation/screens/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String googleIcon = "assets/icons/google_icon.png";
  final loginViewModel = GetIt.instance<LoginViewModel>();

  bool keepSignedIn = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

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
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: isKeyboardOpen
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Column(
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
                            style:
                                TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      CustomEditText(
                          hintText: "Email Address",
                          controller: emailController),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Password",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                              // TODO: Remove default bottom padding
                              TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                  child: const Text("Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff2F4EFF),
                                          fontWeight: FontWeight.bold)))
                            ]),
                      ),
                      CustomEditText(
                        hintText: "Password",
                        controller: passwordController,
                        suffixIcon: Icons.visibility,
                        obscureText: _isObscure,
                        toggleVisibility: _toggleVisibility,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: keepSignedIn,
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
                              context.go("/main");
                            },
                            color: const Color(0xff2F4EFF),
                            textColor: Colors.white),
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
                      CustomButton(
                          text: "Continue with Google",
                          color: Colors.grey,
                          textColor: const Color(0xff4B5768),
                          icon: googleIcon),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          context.push("/register");
                        },
                        child: const Text(
                          'Create an account',
                          style: TextStyle(color: Color(0xff2F4EFF)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
