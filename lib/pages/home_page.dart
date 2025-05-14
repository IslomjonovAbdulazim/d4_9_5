import 'package:flutter/cupertino.dart';
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
  final key = GlobalKey<FormState>();
  int birthYear = DateTime.now().year;
  var isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: key,
            child: ListView(
              children: [
                TextField(
                  controller: nameController,
                  autocorrect: false,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "Ismingizni Kiriting",
                  ),
                ),
                Text("Sizni Ismingiz: ${nameController.text}"),
                SizedBox(height: 10),
                Divider(color: Colors.red),
                SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Yoshingiz kiriting",
                  ),
                  onChanged: (value) {
                    key.currentState?.validate();
                  },
                  validator: (value) {
                    if (int.tryParse(value ?? "") == null) {
                      return "Yoshingizni kiriting";
                    }
                    birthYear = 2025 - int.parse(value!);
                    setState(() {});
                  },
                ),
                Text("Siz $birthYear-yilda tugilsansiz"),
                SizedBox(height: 10),
                Divider(color: Colors.red),
                SizedBox(height: 10),
                TextField(
                  obscureText: isHidden,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (isHidden == true) {
                          isHidden = false;
                        } else if (isHidden == false) {
                          isHidden = true;
                        }
                        setState(() {});
                      },
                      child: Icon(
                        isHidden
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
