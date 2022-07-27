import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/components.dart';

import '../../shared/components/constants.dart';

class BlogPostScreen extends StatelessWidget {
  const BlogPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context, (){_scaffoldKey.currentState!.openDrawer();}),
      drawer: customDrawer(context,_scaffoldKey),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 10,),
            Container(
            width: getWidth(context),
        height: 250,
        decoration:const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/style.jpg'),
            )
        ),),
            const Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('2021 STYLE GUIDE: THE BIGGEST FALL TRENDS',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0),
              child: Text('You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.',
              style: TextStyle(
                height: 1.5
              ),),
            ),
            const Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Posted by OpenFashion |  3 Days ago'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding: EdgeInsets.all(10),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:const Text('#fashion',style: TextStyle(color: Colors.black54)),
                  ), SizedBox(width: 10,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    padding:const EdgeInsets.all(10),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:const Text('#Tips',style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
