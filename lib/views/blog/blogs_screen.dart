import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/components.dart';
import 'package:open_fashion/shared/components/constants.dart';
import 'package:open_fashion/views/blog/blog_post_screen.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context, (){_scaffoldKey.currentState!.openDrawer();}),
      drawer: customDrawer(context,_scaffoldKey),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Container(
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'BLOG',
                  style: TextStyle(height: 1.8, fontSize: 19,fontWeight: FontWeight.w400),
                ),

              ),
              customDivider(),
              const SizedBox(height: 20,),
              SizedBox(
                height: getHeight(context),
                width: getWidth(context),
                child: ListView.separated(itemBuilder: (context,index)=>blogItem(context,index), separatorBuilder: (context,index)=>const SizedBox(height: 25,), itemCount: 10),
              )





            ],
          ),
        ),
      ),
    );
  }
}

blogItem(context,index)=>InkWell(
  onTap: ()=>navigateToNext(context, const BlogPostScreen()),
  child:   Column(

    children: [

      Container(

        width: getWidth(context),

        height: 250,

        decoration: BoxDecoration(

            gradient:  LinearGradient(

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,

                colors: [

                  Colors.black.withOpacity(.5),

                  Colors.black.withOpacity(.3),

                  Colors.black.withOpacity(.3),

                  Colors.black.withOpacity(.7),

                  Colors.black.withOpacity(1)

                ]),

            image:const DecorationImage(

              fit: BoxFit.fill,

              image: AssetImage('assets/images/style.jpg'),

            )

        ),

        child: Container(

          alignment: AlignmentDirectional.bottomStart,

          padding: EdgeInsets.only(left:11,bottom: 15,right: 11),

          decoration: BoxDecoration(

            gradient:  LinearGradient(

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,

                colors: [

                  Colors.grey.withOpacity(.1),

                  Colors.grey.withOpacity(.1),

                  Colors.grey.withOpacity(.1),

                  Colors.black.withOpacity(.5),

                  Colors.black.withOpacity(1)

                ]),),

          child:const Text('2021 STYLE GUIDE: THE BIGGEST FALL TRENDS',

            style: TextStyle(

              color: Colors.white,

              fontSize: 17,

              fontWeight: FontWeight.w300,

              height: 1.5,

            ),),

        ),

      ),

      const SizedBox(height: 9,),

      Row(

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

          Spacer(),

          Text('4 days ago',style: TextStyle(color: Colors.black54),),

        ],

      )

    ],

  ),
);