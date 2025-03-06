import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/services.dart';

class  CreditCardForm extends StatefulWidget {
    CreditCardForm({super.key,});


  @override
  State< CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State< CreditCardForm> {
String cardNumber = '';
String cardHolderName = '';
String expiryDate = '';
String cvv = '';
bool showBack = false;

late FocusNode _focusNode;
TextEditingController cardNumberCtrl = TextEditingController();
TextEditingController expiryFieldCtrl = TextEditingController();

@override
void initState() {
  super.initState();
  _focusNode = FocusNode();
  _focusNode.addListener(() {
    setState(() {
      _focusNode.hasFocus ? showBack = true : showBack = false;
    });
  });
}

@override
void dispose() {
  _focusNode.dispose();
  super.dispose();
}

@override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text("Add New Card" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 25),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            SizedBox(
              height: 30,
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expiryDate,
              cardHolderName: cardHolderName,
              cvv: cvv,
              bankName: 'Axis Bank',
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
              // mask: getCardTypeMask(cardType: CardType.americanExpress),
            ),

            SizedBox(
              height: 40,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: cardNumberCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Card Number',
                      hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                    maxLength: 16,
                    onChanged: (value) {
                      final newCardNumber = value.trim();
                      var newStr = '';
                      final step = 4;

                      for (var i = 0; i < newCardNumber.length; i += step) {
                        newStr += newCardNumber.substring(
                            i, math.min(i + step, newCardNumber.length));
                        if (i + step < newCardNumber.length) newStr += ' ';
                      }

                      setState(() {
                        cardNumber = newStr;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: expiryFieldCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Card Expiry',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                    maxLength: 5,
                    onChanged: (value) {
                      var newDateValue = value.trim();
                      final isPressingBackspace =
                          expiryDate.length > newDateValue.length;
                      final containsSlash = newDateValue.contains('/');

                      if (newDateValue.length >= 2 &&
                          !containsSlash &&
                          !isPressingBackspace) {
                        newDateValue = newDateValue.substring(0, 2) +
                            '/' +
                            newDateValue.substring(2);
                      }
                      setState(() {
                        expiryFieldCtrl.text = newDateValue;
                        expiryFieldCtrl.selection = TextSelection.fromPosition(
                            TextPosition(offset: newDateValue.length));
                        expiryDate = newDateValue;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Card Holder Name',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'CVV',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                    maxLength: 3,
                    onChanged: (value) {
                      setState(() {
                        cvv = value;
                      });
                    },
                    focusNode: _focusNode,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print("Save button clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(256, 48),
                      backgroundColor: Color.fromRGBO(255, 214, 75, 1),
                    ),
                    child: Text("Save",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
