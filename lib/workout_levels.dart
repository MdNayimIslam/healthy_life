import 'package:flutter/material.dart';
import 'package:healthy_life/constants/constants.dart';
import 'package:healthy_life/data/data.dart';
import 'package:healthy_life/models/course.dart';
import 'package:healthy_life/screens/home/components/video.dart';

class WorkoutLevelsPage extends StatefulWidget {
  const WorkoutLevelsPage({Key? key}) : super(key: key);
  @override
  State<WorkoutLevelsPage> createState() => _WorkoutLevelsPageState();
}

class _WorkoutLevelsPageState extends State<WorkoutLevelsPage> {
  Widget _buildCourses(BuildContext context, int index) {
    Course course = courses[index];
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(course.imageUrl),
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
                  width: 100,
                  height: 170,
                ),
                // ignore: sized_box_for_whitespace
                Padding(
                  padding: const EdgeInsets.only(left: 40 ,right: 80),
                  child: Column(
                    children: [
                      Text(
                        course.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            course.time.toString() + ' Minutes | ',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            course.students.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Form(
          child: GestureDetector(
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black45,
              child: Icon(
                Icons.play_arrow,
                size: 40,
                color: Colors.white,
              ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => VideoPlay())),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Workout Levels",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Material(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
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
                          onPressed: () => print('sort'),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: primary,
                            side: const BorderSide(color: primary),
                          ),
                          child: const Text('Advanced'),
                          onPressed: () => print('sort'),
                        )
                      ],
                    ),
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
            ),
          ),
        ));
  }
}
