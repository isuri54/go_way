import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goway/driver_wallet.dart';

import 'package:goway/goway_wallet.dart';
import 'package:goway/credit_card_form.dart';
import 'package:goway/top_up.dart';


void main()
{
  runApp(GoWay());
}
class GoWay extends StatelessWidget {
  const GoWay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: DriverWallet(),
      routes: {
        '/wallet':(context)=>Wallet(),
        '/cardform':(context) =>CreditCardForm(),
        '/topup':(context) =>TopUpPage()

      }
    );
  }
}

