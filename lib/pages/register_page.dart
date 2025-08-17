import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  //email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //login method
  void register(BuildContext context) {
    final auth = AuthService();

    //passwords match -> create user
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
    //password dont match -> tell user to fix
    else {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text('Password don\'t match!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              //logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 50),
              //welcome back message
              Text(
                'Let\'s create an account for you  ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 50),

              //email textfield
              MyTextfield(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),

              SizedBox(height: 15),

              //password textfield
              MyTextfield(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),

              SizedBox(height: 15),

              //Confirm password textfield
              MyTextfield(
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _confirmPasswordController,
              ),

              SizedBox(height: 15),

              //login button
              MyButton(text: 'Register', onTap: () => register(context)),

              //register now
              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have and account?  ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
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
