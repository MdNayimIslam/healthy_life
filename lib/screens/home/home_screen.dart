import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthy_life/constants/constants.dart';
import 'package:healthy_life/routes.dart';
import 'package:healthy_life/screens/home/components/courses.dart';
import 'package:healthy_life/screens/home/components/custom_app_bar.dart';
import 'package:healthy_life/screens/home/components/diff_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selsctedIconIndex = 1;
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToAbout(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.aboutRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(top: appPadding * 2),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CustomAppBar(),
            const DiffStyles(),
            const Courses(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: selsctedIconIndex,
        buttonBackgroundColor: primary,
        height: 60.0,
        color: white,
        onTap: (index) {
          setState(() {
            selsctedIconIndex = index;
          });
        },
        animationDuration: const Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: selsctedIconIndex == 0 ? white : black,
          ),
          Icon(
            Icons.category,
            size: 30,
            color: selsctedIconIndex == 1 ? white : black,
          ),
          Form(
            key: _formKey,
            child: GestureDetector(
              child: Icon(
                Icons.account_circle_rounded,
                size: 30,
                color: selsctedIconIndex == 2 ? white : black,
              ),
              onTap: () => moveToAbout(context),
            ),
          ),
        ],
      ),
    );
  }
}
