import 'package:exam_app/admin/admin_login_page.dart';
import 'package:flutter/material.dart';
import 'login_as_admin_button.dart';

class LoginAsAdminState extends State<LoginAsAdminButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminLoginPage()));
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            child: const Text("Inloggen als admin")));
  }
}
