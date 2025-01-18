import 'package:flutter/material.dart';
import 'package:travel_app/features/Auth/signup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            Text('or'),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Google login
              },
              icon: Icon(Icons.login),
              label: Text('Login with Google'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Facebook login
              },
              icon: Icon(Icons.login),
              label: Text('Login with Facebook'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to signup page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupView()));
              },
              child: Text("Don't have an account? Signup"),
            ),
          ],
        ),
      ),
    );
  }
}
