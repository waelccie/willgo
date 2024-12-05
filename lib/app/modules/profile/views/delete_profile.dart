import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/widgets/phone_text_form_field.dart';
import 'package:willgo/app/widgets/progress_button.dart';

import '../../../widgets/custom_text_field.dart';

class DeleteProfile extends StatefulWidget {
  const DeleteProfile({super.key});

  @override
  State<DeleteProfile> createState() => _DeleteProfileState();
}

class _DeleteProfileState extends State<DeleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Delete Account',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          PhoneTextFormField(
              controller: TextEditingController(),
              hintText: 'enter your phone'),
          CustomTextField(
            isPassword: true,
            hint: "password",
          ),
          AppProgressButton(
            onPressed: (c) {},
            child: Text(
              "Delete Your Account",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
