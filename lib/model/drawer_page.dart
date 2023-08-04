import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: 360,
                height: 80,
                color: Colors.lightGreen,
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                height: 80,
                color: Colors.lightGreen,
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                height: 80,
                color: Colors.lightGreen,
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                height: 80,
                color: Colors.lightGreen,
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                width: 360,
                height: 80,
                color: Colors.lightGreen,
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
      ),

    );
  }
}
