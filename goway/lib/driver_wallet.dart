import 'package:flutter/material.dart';

class DriverWallet extends StatefulWidget {
  const DriverWallet({super.key});

  @override
  State<DriverWallet> createState() => _DriverWalletState();
  }

class _DriverWalletState extends State<DriverWallet> {
  final driverprice=1000;

  //creating a alert box for the withdrawel

  void _showModalBottomSheetpending(context) {
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
                  Icons.pending,
                  size: 70,
                  color: Colors.green,
                ),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    "Pending",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Amount:${driverprice}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    "Your withdrawal request has been submitted. Please note that all withdrawals are processed manually.",
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
                      // Close the alert dialog first
                      Navigator.pop(context);

                    },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 214, 75, 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "OK",
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text("Goway Wallet" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          Container(
            height: 280,
            width: 355,
            decoration: BoxDecoration(

                color: Color.fromRGBO(235, 232, 232, 0.86),
                borderRadius:BorderRadius.circular(20),
                border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.28))

            ),
            child: Column(

              children: [
                Image.asset("go_way_images/walletlogo.png",height: 60,width: 60,),
                Text("Goway Customer Wallet",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                SizedBox(height:
                40,),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text("Current balance:",style: TextStyle(color: Colors.black,fontSize: 17)),
                ),
                Text("Rs:$driverprice",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),)
              ],
            ),


          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                ElevatedButton(
                    onPressed: (){
                      _showModalBottomSheetpending(context);

                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(184, 50),
                      backgroundColor: Color.fromRGBO(255, 214, 75, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        Text("Withdraw",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),),
                      ],
                    )
                ),

              ],

            ),
          ),

        ],


      ),



    );
  }
}




