import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/components.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context, (){_scaffoldKey.currentState!.openDrawer();}),
      drawer: customDrawer(context,_scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                 children: [
                   const SizedBox(
                     height: 20,
                   ),
                   const Text(
                     'CONTACT US',
                     style: TextStyle(height: 1.8, fontSize: 18),
                   ),
                   customDivider(),
                   const SizedBox(height: 10,),
                   const Text('Need an ASAP answer? Contact us via chat, 24/7! For existing furniture orders, please call us.',
                       style:TextStyle(height: 1.8, fontWeight: FontWeight.w300,fontSize: 16)),
                   const SizedBox(height: 20,),
                   defaultButton(context: context,child: Text('CHAT WITH US',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 17),),minWidth: 200.0)
                   ,const SizedBox(height: 30,),
                   const Text('You can text us at 800-309-2622 – or click on the “text us” link below on your mobile device. Please allow the system to acknowledge a simple greeting (even “Hi” will do!) before providing your question/order details. Consent is not required for any purchase. Message and data rates may apply. Text messaging may not be available via all carriers.',
                       style:TextStyle(height: 1.8, fontWeight: FontWeight.w300,fontSize: 16)),
                   const SizedBox(height: 20,),
                   defaultButton(context: context,child: Text('TEXT US',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 17),),minWidth: 140.0)
                   ,const SizedBox(height: 30,),
                   const Text('To send us a private or direct message, like @Open Fashion on Facebook or follow us on Twitter. We’ll get back to you ASAP. Please include your name, order number, and email address for a faster response!',
                       style:TextStyle(height: 1.8, fontWeight: FontWeight.w300,fontSize: 16)),
                   const SizedBox(height: 20,),
                   const SizedBox(height: 30,),
                  socialContacts(context, 50.0),
                   const SizedBox(height:100 ,),
                 ],
               ),
             ),
              copyRightText(context)
            ],
          ),

      ),
    );
  }
}
