import 'package:flutter/material.dart';
import 'package:healthy_life/constants/constants.dart';
import 'package:healthy_life/data/data.dart';
import 'package:healthy_life/models/style.dart';
import 'package:healthy_life/routes.dart';

class DiffStyles extends StatefulWidget {
  const DiffStyles({Key? key}) : super(key: key);

  @override
  State<DiffStyles> createState() => _DiffStylesState();
}

class _DiffStylesState extends State<DiffStyles> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToFeaturedWorkout(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.featuredWorkoutRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  _buildStyles(BuildContext context, int index) {
    Style style = styles[index];

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
          child: Container(
              margin: const EdgeInsets.only(
                  top: appPadding * 1, bottom: appPadding * 1),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(style.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.3),
                        blurRadius: 20.0,
                        offset: const Offset(5, 5))
                  ]),
              child: Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      
                      Text(
                        style.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          style.time.toString() + ' Minutes | ',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          style.students.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, top: 0, bottom: 0, right: 0),
              child: const Text(
                'Good Morning, Shamim👋',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: black, fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Featured Workout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
              Form(
                key: _formKey,
                child: GestureDetector(
                  child: const Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primary),
                  ),
                  onTap: () => moveToFeaturedWorkout(context),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          // ignore: sized_box_for_whitespace
          child: Container(
            height: size.height * 0.33,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: styles.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStyles(context, index);
                }),
          ),
        )
      ],
    );
  }
}
