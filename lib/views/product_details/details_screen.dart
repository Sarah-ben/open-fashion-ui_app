import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/models/products_model.dart';
import 'package:open_fashion/shared/components/components.dart';
import 'package:open_fashion/shared/components/constants.dart';

class DetailsScreen extends StatelessWidget {
   Product product;
   DetailsScreen(this.product) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
      ),
      body:SizedBox(
        width: getWidth(context),
        height: getHeight(context),
        child: SingleChildScrollView(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: getWidth(context),
                      height: 500.0,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.image_link!)
                        )
                      ),
                    ),
                    const SizedBox(height:20 ,),
                     Text(product.name! , style:const TextStyle(
                        height: 1.8, fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                     Text(
                      product.category!,
                      style:const TextStyle(
                          height: 1.7,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.7,
                          overflow: TextOverflow.ellipsis),
                    ),
                     Text(
                      '\$ ${product.price}',
                      style:const TextStyle(
                          height: 1.7,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0,overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 10,),
                    Row(

                      children:const [
                        Text('  Color  ',style: TextStyle(fontWeight: FontWeight.w400),),
                        CircleAvatar(backgroundColor: Colors.red,radius: 10,),
                        SizedBox(width: 8,),
                        CircleAvatar(backgroundColor: Colors.yellow,radius: 10,),
                        SizedBox(width: 8,),
                        CircleAvatar(backgroundColor: Colors.grey,radius: 10,),
                        SizedBox(width: 8,),
                        CircleAvatar(backgroundColor: Colors.green,radius: 10,),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text('DESCRIPTION' , style: TextStyle(
                        height: 1.8, fontWeight: FontWeight.w300, fontSize: 19),
                    ),

                     Text(product.description!,
                      style:const TextStyle(
                          height: 1.8,  fontSize: 13),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                       const Text('PRODUCT TYPE   ' , style: TextStyle(
                            height: 1.8, fontWeight: FontWeight.w300, fontSize: 16),
                        ),

                        Text(product.product_type! , style:const TextStyle(
                            height: 1.8, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('FROM   ' , style: TextStyle(
                            height: 1.8, fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        Text(product.brand! , style:const TextStyle(
                            height: 1.8, fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('CATEGORY   ' , style: TextStyle(
                            height: 1.8, fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        Text(product.category! , style:const TextStyle(
                            height: 1.8, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      alignment: AlignmentDirectional.center,
                         child:const Text('@TRENDING', style: TextStyle(
                             height: 1.8, fontSize: 17),),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          padding:const EdgeInsets.all(10),
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:const Text('#curruntly_free'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: ()=>launchURL(product.product_link!)
                      ,
                      child:const Text('product link in official website',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              defaultButton(context: context,child: Row(
                children:const [
                  Icon(Icons.add,color:Colors.white),
                  Text('   ADD TO BASKET',style: TextStyle(fontWeight:FontWeight.w400,fontSize:16,color: Colors.white),),Spacer(),
                  Icon(Icons.favorite_border,color: Colors.white,)
                ],
              )),

            ],
          ),
        ),
      ),
    );
  }
}
