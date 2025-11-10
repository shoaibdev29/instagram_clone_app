import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/widgets/test_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              //instagrama logo
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              //field for profile pic
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170",
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo, color: primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              //text field for username
              TextFieldInput(
                controller: _usernameController,
                hintText: "Enter your username",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              //text field for email
              TextFieldInput(
                controller: _emailController,
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              //text field for password
              TextFieldInput(
                controller: _passwordController,
                hintText: "Enter your password",
                keyboardType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              //text field for bio
              TextFieldInput(
                controller: _bioController,
                hintText: "Enter your bio",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              //button login
              GestureDetector(
                onTap: () => print("Login tapped"),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                  child: const Text("Log in"),
                ),
              ),
              Flexible(flex: 2, child: Container()),
              //transition to signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have an account?"),
                  ),
                  GestureDetector(
                    onTap: () => print("Sign up tapped"),
                    child: const Text(
                      " Sign up.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
