import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:healthy_life/constants/constants.dart';
import 'package:healthy_life/routes.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToNotifications(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.notificationsRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(appPadding / 8),
                child: Container(
                  decoration: const BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding / 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(appPadding / 8),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/logo.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              const Text(
                ' HEALTHY',
                style: TextStyle(
                    color: black, fontWeight: FontWeight.normal, fontSize: 20),
              ),
              const Text(
                'LIFE',
                style: TextStyle(
                    color: black, fontWeight: FontWeight.w800, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: GestureDetector(
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        size: 30.0,
                      ),
                      onTap: () => moveToNotifications(context),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(30.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '0',
                        style: TextStyle(color: white, fontSize: 8),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
