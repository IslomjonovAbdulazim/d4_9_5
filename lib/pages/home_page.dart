import 'package:flutter/material.dart';

// 1. Ismini -> Output
// 2. Yoshini -> Tugilgan Yil
// 3. Like Button
// 4. PasswordField
// 5. Change Picture

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: [
                TextField(
                  controller: nameController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Ismingizni Kiriting",
                  ),
                ),
                Text("Sizni Ismingiz: ${nameController.text}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}










