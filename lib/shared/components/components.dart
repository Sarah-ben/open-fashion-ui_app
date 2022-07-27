import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/views/favorites/favorites_screen.dart';
import 'package:open_fashion/views/search/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../views/blog/blogs_screen.dart';
import '../../views/contact_us/contactus_screen.dart';
import '../../views/ourStory/ourstory_screen.dart';
import 'constants.dart';

AppBar appBar(context,onTap)=>AppBar(
  centerTitle: true,
  title: Image.asset(
    'assets/images/logo.jpg',
    width: 80,
  ),
  toolbarHeight: 50,
  leading: InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Image.asset(
        'assets/images/menu.jpg',
        width: 20,
      ),
    ),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: ()=>navigateToNext(context, SearchScreen()),
        child: Image.asset(
          'assets/images/search.jpg',
          width: 23,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 17.0),
      child: InkWell(
        onTap: ()=>navigateToNext(context,const FavoritesScreen()),
        child: Image.asset(
          'assets/images/shopping_list.jpg',
          width: 23,
        ),
      ),
    ),
  ],
);
navigateAndReplace({required BuildContext context,required nextPage})=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>nextPage));
Widget customDivider()=>Image.asset('assets/images/divider.jpg',width: 150,);
copyRightText(context)=>Container(
  width: getWidth(context),
  height: 50,
  color: Colors.grey.withOpacity(.3),
  alignment: AlignmentDirectional.center,
  child:const Text('Copyright@ OpenUI all rights reserved',style: TextStyle(fontWeight: FontWeight.w300),),
);
launchURL(String Url) async {
  var url = Url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
defaultButton({required BuildContext context,child,minWidth})=>FlatButton(
  color: Colors.black,onPressed: (){}, child:child,minWidth:minWidth?? getWidth(context),height: 50,);

defaultFormField({
  controller,
  hint
})=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0),
  child: TextFormField(
      controller:controller ,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle:const TextStyle(
              fontSize: 15
          )
      )
  ),
);
String selectedBrand = 'Acer';

List<String> Brand = [
  'Pencil',
  'Eye shadow',
  'Lipstick',
  'Gloss',
  'Foundation',
  'Liquid hhhhh hhhhhh hhhh ',

];

customDrawer(context,_scaffoldKey)=>Drawer(
  backgroundColor: Colors.white,
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25,),
        InkWell(onTap: ()=>_scaffoldKey.currentState!.openEndDrawer(),child: Icon(Icons.close),),
        const SizedBox(height: 30,),
    const ExpansionTile(
      title:   Text(
        'New',
        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
      ),
      children: <Widget>[

      ],),

       // const SizedBox(height:5 ,),
        const ExpansionTile(
          title:   Text(
            'Apparel',
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
          ),
          children: <Widget>[

          ],),

        const ExpansionTile(
          title:   Text(
            'Shoes',
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
          ),
          children: <Widget>[

          ],),
        const ExpansionTile(
          title:   Text(
            'Bags',
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
          ),
          children: <Widget>[

          ],),
        const ExpansionTile(
          title:   Text(
            'Beauty',
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
          ),
          children: <Widget>[

          ],),
        const ExpansionTile(
          title:   Text(
            'Accessories',
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),
          ),
          children: <Widget>[

          ],),
        const SizedBox(height:30 ,),
        Row(
          children: [
            const SizedBox(width: 15,),
            Image.asset('assets/images/phone.jpg',width: 27,height: 27,),
            const SizedBox(width: 20,),
            const Text('+213.540.996.96',style: TextStyle(fontSize: 17),)
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            const SizedBox(width: 15,),

            Image.asset('assets/images/location.jpg',width: 27,height: 27,),
            const SizedBox(width: 20,),
            const Text('Store Locator',style: TextStyle(fontSize: 17),)
          ],
        ),
       const Spacer(),
        socialMediaLinks(40.0),
      ],
    ),
  ),
);
socialContacts(context,padding,{rowPadding})=>Column(
  children: [
    socialMediaLinks(padding),
    const SizedBox(height: 30,),
    customDivider(),
    const SizedBox(height: 50,),
    Padding(
      padding:  EdgeInsets.symmetric(horizontal:rowPadding?? 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: ()=>navigateToNext(context, OurStory()),
              child:const Text('About ',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w300),)),
          InkWell(
              onTap: ()=>navigateToNext(context, ContactUsScreen()),
              child:const Text('Contact ',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w300),)),
          InkWell(
              onTap: ()=>navigateToNext(context, BlogScreen()),

              child:const Text('Blog',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w300),)),
        ],
      ),
    ),
  ],
);
socialMediaLinks(padding)=>    Padding(
  padding:  EdgeInsets.symmetric(horizontal: padding),
  child: SizedBox(
    height: 35,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: ()=>launchURL('https://www.instagram.com'),
            child: Image.asset('assets/images/instagram.jpg',height: 30)),
        InkWell(
          onTap: ()=>launchURL('https://www.twitter.com'),
          child:Image.asset('assets/images/twitter.jpg',height: 30),
        ),
        InkWell(
          onTap: ()=>launchURL('https://www.youtube.com'),
          child:Image.asset('assets/images/youtube.jpg',height: 22,),
        )
      ],
    ),
  ),
);

navigateToNext(context,nextPage)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>nextPage));

trendsItem(String text)=>Text(text,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 18,height: 1.7),);
