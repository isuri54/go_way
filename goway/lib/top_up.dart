import 'package:flutter/material.dart';


import 'goway_wallet.dart';

class TopUpPage extends StatefulWidget {
   TopUpPage({super.key});



  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final usertopupamount=TextEditingController();
  void WalletPageNavigator(){
    Navigator.pushReplacementNamed(context,'/wallet');
  }
  //confirm alert


  void _showModalBottomSheetconfirm(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ListTile(
                title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment method",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w400,)
                    ),
                    Text("card details variable",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400,))
                  ],
                ),
              ),
              ListTile(
                title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top-up amount",style: TextStyle(fontSize: 18,color:Colors.grey,fontWeight: FontWeight.w400,),
                    ),
                    Text("Rs:${usertopupamount.text}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w400,))

                  ],
                ),
              ),
              ListTile(
                title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total",style: TextStyle(fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold,),),
                    Text("Rs:${usertopupamount.text}",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),

              const SizedBox( height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: (){
                      _showModalBottomSheetsuccess(context);

                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 214, 75, 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black,
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



  final  currentbalance=1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text("Enter Amount" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25),),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Container(


              width: 350,
              decoration: BoxDecoration(

              ),
              child: Form(

                child: TextFormField(
                  controller: usertopupamount,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),
                  decoration: InputDecoration(
                
                    labelText: "RS",
                    labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),

                
                
                  ),
                ),
              ),
            ),
            
            
          ),
          Text("Current Balance:${currentbalance}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
          SizedBox(height: 40,),
          ElevatedButton(
              onPressed:(){




                //_showModalBottomSheetunsuccess(context);
                //_showModalBottomSheetsuccess(context);
                _showModalBottomSheetconfirm(context);


              },
              style: ElevatedButton.styleFrom(
                fixedSize:Size(256, 48) ,
                backgroundColor: Color.fromRGBO(255, 214, 75, 1)
              ),
              child:Text("Next",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),))
        ],
      ),
    );
  }
}

//creating the methods for alerts.....

//unsuccess alert

void _showModalBottomSheetunsuccess(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Icon(
                Icons.error,
                size: 70,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Top-up unsuccessful",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Your payment methods have not been charged.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox( height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 214, 75, 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Try Again",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
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

//success alert

void _showModalBottomSheetsuccess(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Icon(
                Icons.check_circle,
                size: 70,
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Top-up successful",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Your wallet has been Updated!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox( height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context); // Close the alert dialog first
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Wallet()), // Replace WalletPage with the actual widget
                          (route) => false, // Remove all previous routes
                    );
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 214, 75, 1)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
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




