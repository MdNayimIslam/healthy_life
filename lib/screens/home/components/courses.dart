import 'package:flutter/material.dart';
import 'package:healthy_life/constants/constants.dart';
import 'package:healthy_life/data/data.dart';
import 'package:healthy_life/models/course.dart';
import 'package:healthy_life/routes.dart';

// ignore: must_be_immutable
class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToWorkoutLevels(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.workoutLevelsRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  Widget _buildCourses(BuildContext context, int index) {
  
    Course course = courses[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 5),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                    image: AssetImage(course.imageUrl),
                    fit: BoxFit.cover,
                  ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.3),
                  blurRadius: 30.0,
                  offset: const Offset(10, 15))
            ]),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: 300,
              height: 130,
            ),
            // ignore: sized_box_for_whitespace
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text(
                    course.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        course.time.toString() + ' Minutes | ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: white.withOpacity(0.6)),
                      ),
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      course.students.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: white.withOpacity(0.6)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0,bottom: 0, left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Workout Levels',
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
                        onTap: () => moveToWorkoutLevels(context),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: primary,
                        side: const BorderSide(color: primary),
                      ),
                      child: const Text('Beginner'),
                      onPressed: () => {},
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: primary,
                        side: const BorderSide(color: primary),
                      ),
                      child: const Text('Intermediate'),
                      onPressed: () => {},
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: primary,
                        side: const BorderSide(color: primary),
                      ),
                      child: const Text('Advanced'),
                      onPressed: () => {},
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return _buildCourses(context, index);
            },
          ))
        ],
      ),
    );
  }
}
