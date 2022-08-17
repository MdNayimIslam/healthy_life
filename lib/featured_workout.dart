import 'package:flutter/material.dart';
import 'package:healthy_life/constants/constants.dart';
import 'package:healthy_life/data/data.dart';
import 'package:healthy_life/models/style.dart';
import 'package:healthy_life/screens/home/components/video.dart';


class FeaturedWorkoutPage extends StatefulWidget {
  const FeaturedWorkoutPage({Key? key}) : super(key: key);
  @override
  State<FeaturedWorkoutPage> createState() => _FeaturedWorkoutPageState();
}

class _FeaturedWorkoutPageState extends State<FeaturedWorkoutPage> {
  

  Widget _buildStyles(BuildContext context, int index) {
    Style style = styles[index];
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(style.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(.3),
                        blurRadius: 30.0,
                        offset: const Offset(10, 15))
                  ]),
              child: Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 100,
                    height: 305,
                  ),
                  // ignore: sized_box_for_whitespace
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 80),
                    child: Column(
                      children: [
                        Text(
                          style.name,
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
                      ],
                    ),
                  ),
                ],
              ),
            )),
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
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=> VideoPlay())),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Featured Workout",
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
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80.0, left: 25.0),
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/logo.png',
                        ),
                      ),
                      const Text(
                        ' HEALTHY',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20),
                      ),
                      const Text(
                        'LIFE',
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Good Morning, Shamim👋',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return _buildStyles(context, index);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
