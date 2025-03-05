import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}
final price=25700;
class _WalletState extends State<Wallet> {
  void CardFormNavigation(context){
    Navigator.pushNamed(context, '/cardform');

  }
  void TopUpNavigation(context){
    Navigator.pushNamed(context, '/topup');
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
                Text("Rs:$price",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),)
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
                      CardFormNavigation(context);
                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(184, 50),
                      backgroundColor: Color.fromRGBO(255, 214, 75, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_card, size:30,color: Colors.black,),

                        Text("ADD CARD",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                      ],
                    )
                ),
                ElevatedButton(
                    onPressed: (){
                      TopUpNavigation(context);
                    },

                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(184, 50),
                      backgroundColor: Color.fromRGBO(255, 214, 75, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.attach_money, size:30,color: Colors.black,),

                        Text("TOP UP",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
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
