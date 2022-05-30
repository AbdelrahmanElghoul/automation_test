import 'package:automation/secondary_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController? emailController;
  TextEditingController? passwordController;
  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (val) {
                bool match = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(val ?? '');

                if (match) return null;
                return "wrong email validation";
              },
            ),
            TextFormField(
              controller: passwordController,
              validator: (val) {
                bool match = (val?.length ?? 0) > 6;

                if (match) return null;
                return "password must be more than 6";
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SecondaryScreen(),
                    ),
                  );
                }
              },
              child: const Text("Navigate"),
            )
          ],
        ),
      ),
    );
  }
}
