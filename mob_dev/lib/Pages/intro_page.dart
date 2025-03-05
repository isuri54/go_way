import 'package:flutter/material.dart';
import 'package:mob_dev/Pages/complain_warning.dart';

class IntroPage extends StatelessWidget {
  const IntroPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //GoWay Logo
            const SizedBox(height: 50,),
            Image.asset(
              'lib/Images/GoWayLogo.png',
              height: 70,
            ),

            // Title
            const Text(
              "Your Journey, Your Way!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 80),

            //sub Title
            const Text(
              "Travel & Enjoy with the Most Reliable Public Transport",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),

            // Big Picture
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset(
                  'lib/Images/GowayBig.png',
                  height: 250,
                ),
            ),

            //GoWay button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context){
                              return ComplainWarning();
                            },
                        ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      "GoWay!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return ComplainWarning();
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
