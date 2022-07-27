import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/components.dart';
import 'package:open_fashion/shared/components/constants.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>Navigator.pop(context),
          icon:const Icon(Icons.close,color: Colors.black,)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      const   Text('CART' , style: TextStyle(
                          height: 1.8, fontWeight: FontWeight.w400, fontSize: 20),
                         ),

                   const  SizedBox(height: 10,),
                   SizedBox(
                     height: getHeight(context)+100,
                     width: getWidth(context),
                     child: ListView.separated(
                       physics:const BouncingScrollPhysics(),
                         itemBuilder: (BuildContext context,int index)=>getFavItem(index), separatorBuilder: (BuildContext context,int index)=>SizedBox(height: 15,), itemCount: 4),
                   ),
                  
                ],
              ),
            ),
            defaultButton(
                context: context,child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                 Text('CHECKOUT  |   ',style: TextStyle(fontWeight:FontWeight.w400,fontSize:16,color: Colors.white),),
                 Text('TOTAL  \$120',style: TextStyle(fontWeight:FontWeight.w400,fontSize:16,color: Colors.white),),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

getFavItem(int index)=>Row(
  children: [
    Container(
      width: 110,
      height: 160,
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/shirt.jpg'),
              fit: BoxFit.cover
          )
      ),
    ),
    const SizedBox(width: 12,),
    Expanded(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('LAMERI' , style: TextStyle(
            height: 1.8, fontWeight: FontWeight.w400, fontSize: 17),
        ),
        const SizedBox(height: 10,),
        const Text(
          'reversibal argona cardibal',
          style: TextStyle(
              height: 1.7,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.black54,
              overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(height: 10,),
        Row(
          children: const[
            CircleAvatar(
                backgroundColor: Colors.black12,
                radius:11,
                child: CircleAvatar(backgroundImage: AssetImage('assets/images/mines.jpg'),radius: 10,))
            ,                                   Text('   1   ',style: TextStyle(fontSize: 17),),
            CircleAvatar(
                backgroundColor: Colors.black12,
                radius:11,
                child: CircleAvatar(backgroundImage: AssetImage('assets/images/plus.jpg'),radius: 10,))
          ],
        ),
        const SizedBox(height: 15,),
        const Text(
          '\$120',
          style: TextStyle(
              height: 1.7,
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.w500,
              fontSize: 17.0),
        ),
        const SizedBox(height: 5,)
      ],
    )),

  ],
);
