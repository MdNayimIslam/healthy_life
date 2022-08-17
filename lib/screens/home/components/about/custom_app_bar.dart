import 'package:flutter/material.dart';
import 'package:healthy_life/routes.dart';
import 'package:healthy_life/screens/home/components/about/rounded_button.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Form(
          key: _formKey,
          child: RoundedButton(
            icon: const Icon(Icons.arrow_back),
            iconColor: Colors.deepOrange,
            bgColor: Colors.white,
            tap: () => moveToHome(context),
          ),
        ),
      ],
    );
  }
}
