import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/constants.dart';
import 'package:open_fashion/views/blog/blogs_screen.dart';
import 'package:open_fashion/views/contact_us/contactus_screen.dart';
import 'package:open_fashion/views/home/home_screen.dart';
import 'package:open_fashion/views/ourStory/ourstory_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/components/components.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
        appBar: appBar(context, (){_scaffoldKey.currentState!.openDrawer();}),
        drawer: customDrawer(context,_scaffoldKey),

        body:SizedBox(

        width: getWidth(context),
        height: getHeight(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: getWidth(context),
                height: getHeight(context),
                decoration:const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/background.jpg'))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getHeight(context) / 3.6,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: RichText(text:const TextSpan(text: 'LUXURY\n',style:TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 40.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.black54),
                            children: [
                              TextSpan(
                                text: ' FASHION\n',
                              ),
                              TextSpan(
                                text: '&ACCESSORIES ',
                              ),
                            ]),),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: ()=>navigateAndReplace(context: context, nextPage: HomePage()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65.0),
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            width: getWidth(context),
                            height: 50,
                            child:const Text('EXPLORE  COLLECTION',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w400),),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: getWidth(context),
                height: getHeight(context),
                child:  Column(
                    children: [
                     const SizedBox(height: 50,),
                      Image.asset('assets/images/logo.jpg',width: 120,),
                   const  SizedBox(height: 10,),
                  const   Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 50.0),
                       child:  Text('Making a luxurious lifestyle accessible for a generous grope of women is our daily drive',
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300,height: 1.5),textAlign:TextAlign.center),
                     ),
                      const SizedBox(height: 20,),
                      customDivider(),
                      const SizedBox(height: 50,),
                    const Text('FOLLOW US',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
                    const SizedBox(height: 30,),
                      socialContacts(context,90.0),
                      const Spacer(),
                      copyRightText(context)
                    ],
                  ),

              )
            ],
          ),
        ),
      )

    );
  }

}
