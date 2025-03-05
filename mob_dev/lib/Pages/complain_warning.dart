import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class ComplainWarning extends StatelessWidget {
  const ComplainWarning ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              "Complaints",
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    "Current Location/Police Station",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  const SizedBox(width: 37,),
                  Icon(
                    Icons.location_pin,
                    size: 25,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    "Driver Details/Bus Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 83,),
                  Icon(
                    Icons.train,
                    size: 25,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    "My Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 200),
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            height: 180,
            padding: EdgeInsets.all(7.0),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              decoration: InputDecoration(

                hintText: "Type Your Complain",
                hintStyle:  TextStyle(fontWeight: FontWeight.bold,color: Colors.black,
                    fontSize: 17,),
                border: InputBorder.none,
              ),

              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox( height: 20,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    "Attach Photos/Video",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(width: 155,),
                  Icon(
                    Icons.attachment_sharp,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: (){
                _showModalBottomSheet(context);
              },

              style: ElevatedButton.styleFrom(
                  fixedSize: Size(184, 50),
                  backgroundColor: Colors.yellow
                ),
              child: Text(
                "Complain",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void _showModalBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 700,
        child: Column(
          children: [
            ListTile(
              title: Icon(
                Icons.warning,
                size: 75,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Warning!!!",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "By submitting this complaint, the following details will be shared with the police department.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Note: Proving false or misleading information is a punishable offense under the law",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox( height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton(
                    onPressed: (){
                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
