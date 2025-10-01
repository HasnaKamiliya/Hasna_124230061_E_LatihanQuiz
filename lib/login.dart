import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  void _login() {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(username: username.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
            content: Text("Login gagal, username dan password harus diisi"),
            backgroundColor: Colors.red
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromARGB(255, 62, 31, 106);
    const Color surfaceColor = Color.fromARGB(255, 222, 204, 247);
    const Color textColor = Color.fromARGB(255, 0, 0, 0);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            const Text(
              "Silakan Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            TextField(
              controller: username,
              style: const TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Username",
                labelStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: surfaceColor,
                prefixIcon: Icon(Icons.person_outline, color: Color.fromARGB(255, 73, 72, 72)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: password,
              obscureText: true,
              style: const TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Password",
                labelStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: surfaceColor,
                prefixIcon: Icon(Icons.lock_outline, color: Color.fromARGB(255, 73, 72, 72)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}