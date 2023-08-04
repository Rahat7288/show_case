import 'package:flutter/material.dart';
import 'package:show_case/widgets/show_case/show_case.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //defining the variable to change the screen size
  //global keys for the individual showcase widgets

  final GlobalKey globalKeyMenu = GlobalKey();
  final GlobalKey globalKeyProfile = GlobalKey();
  final GlobalKey globalKeySearch = GlobalKey();
  final GlobalKey globalKeyGoBack = GlobalKey();

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_)=> ShowCaseWidget.of(context).startShowCase(
      [
        globalKeyMenu,
        globalKeyProfile,
        globalKeySearch,
        globalKeyGoBack,



      ]
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
      duration: Duration(microseconds: 250),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(isDrawerOpen? 40: 0.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            //header of appBar
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen? ShowCaseView(
                      globalKey: globalKeyMenu,
                      title: 'Menu',
                      description: 'find your menu here',
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      )
                  ) :  IconButton(onPressed: (){
                        setState(() {
                          // Takes right and left
                          xOffset = 380;
                          //takes ups and down
                          yOffset =120;
                          //change the size
                          scaleFactor = .8;
                          isDrawerOpen = true;
                        });
                      }, icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      ),




                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10,),
                          Text(
                              "Dhaka",
                            style: TextStyle(
                                fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )

                    ],
                  ),


                  ShowCaseView(
                      globalKey: globalKeyProfile,
                      title: "profile",
                      description: "profile page navigator",
                      child: CircleAvatar(),
                  )


                ],
              ),
            ),

            //center point ends header for appbar


            //appbody start

            Container(

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

              ),

              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text(
                      "Search some thing",
                    style: TextStyle(
                        fontSize: 18,
                      color: Colors.pinkAccent
                    ),
                  ),
                  Icon(Icons.settings),
                ],
              ),

            )
          ],

        ),
      ),

    );
  }
}
