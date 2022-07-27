import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/shared/Cubit/app_cubit.dart';
import 'package:open_fashion/shared/Cubit/app_states.dart';
import 'package:open_fashion/shared/components/components.dart';
import 'package:open_fashion/shared/components/constants.dart';
import 'package:open_fashion/views/product_details/details_screen.dart';

import '../../models/products_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedBrand = 'Acer';

  List<String> Brand = [
    'Pencil',
    'Eye shadow',
    'Lipstick',
    'Gloss',
    'Foundation',
    'Liquid',

  ];

bool isList=false;
bool isFull=false;
  @override
  Widget build(BuildContext context) {
    var _scaffoldKey =  GlobalKey<ScaffoldState>();

    return BlocConsumer<AppCubit,AppStates>(builder: (context,state){
      return Scaffold(
        key: _scaffoldKey,
        appBar: appBar(context, (){_scaffoldKey.currentState!.openDrawer();}),
        drawer: customDrawer(context,_scaffoldKey),
        body: SizedBox(
            width: getWidth(context),
            height: getHeight(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(context)+200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: DropdownButtonFormField2(
                                    style: const TextStyle(color: Colors.grey),
                                    selectedItemHighlightColor:
                                    Colors.grey.withOpacity(.1),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(.1),
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'Any',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black54),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black54,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: Brand.map(
                                            (item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        )).toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return '__Any';
                                      }
                                    },
                                    onChanged: (value) {
                                      selectedBrand = value.toString();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: (){
                                    AppCubit.get(context).getProduct();
                                    setState(() {
                                      isFull=!isFull;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Image.asset(isFull?'assets/images/grid_view_full.png':
                                    'assets/images/grid_view_listed.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {

                                      isList=!isList;
                                      //list_asset='assets/images/youtube.jpg';
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(7.0),
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child:
                                    Image.asset(isList?'assets/images/islistview.png':'assets/images/grid_view.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        !isFull? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(width: getWidth(context),
                              height: getHeight(context),
                              child: ListView.separated(itemBuilder: (BuildContext context,int index)=>getFullScreenItem(AppCubit.get(context).products[index], context), separatorBuilder: (BuildContext context,int index)=>SizedBox(height: 20,), itemCount:  AppCubit.get(context).products.length)),
                        ):
                        !isList?Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                          child: SizedBox(
                            height: getHeight(context) - 190,
                            width: getWidth(context),
                            child: GridView.count(
                              childAspectRatio: 1 / 1.85,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 5,
                              children: List.generate(
                                  AppCubit.get(context).products.length, (index) => getGridItem(AppCubit.get(context).products[index], context)),
                            ),
                          ),
                        ):
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(width: getWidth(context),
                              height: getHeight(context),
                              child: ListView.separated(itemBuilder: (BuildContext context,int index)=>getListItem(AppCubit.get(context).products[index], context), separatorBuilder: (BuildContext context,int index)=>SizedBox(), itemCount: AppCubit.get(context).products.length)),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )),
      );
    }, listener: (context,state){});
  }

  getGridItem(Product product, context) => InkWell(
    onTap: ()=>navigateToNext(context, DetailsScreen(product)),
    child: SizedBox(
          //width: (getWidth(context)/2)-40,
          //height: 328.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: getWidth(context) / 2,
                    height: 250,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(product.image_link!),
                      fit: BoxFit.cover,
                    )),
                  ),
                  InkWell(
                    onTap: () => null,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
               Text(
                product.name!,
                style:const TextStyle(
                    height: 1.5, fontWeight: FontWeight.w500, fontSize: 15),
              ),
               Text(
                product.product_type!,
                style:const TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis),
              ),
               Text(
                '  \$ ${product.price}',
                style: const TextStyle(
                    height: 1.5,
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0),
              ),
            ],
          ),
        ),
  );
  getListItem(Product product, context) => InkWell(
    onTap: ()=>navigateToNext(context, DetailsScreen(product)),

    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 110,
            height: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.image_link!),
                    fit: BoxFit.cover
                )
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(product.name! , style:const TextStyle(
                  height: 1.8, fontWeight: FontWeight.w500, fontSize: 15),
              ),
               Text(
                product.product_type!,
                style:const TextStyle(
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis),
              ),
               Text(
                '\$ ${product.price}',
                style:const TextStyle(
                    height: 1.7,
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0),
              ),
              const SizedBox(height: 10,),
              Row(
                children:const [
                  Icon(Icons.star,color: Colors.deepOrangeAccent,size: 18,),
                  Text('4.8 Rating')
                ],
              ),
              const SizedBox(height: 15,),
               Text(product.category!),
              const SizedBox(height: 15,)
            ],
          )),
          const Padding(
            padding:EdgeInsets.only(bottom: 18.0,right: 20),
            child: Icon(Icons.favorite_border_outlined,color: Colors.deepOrangeAccent,),
          )
        ],
      ),
    ),
  );
  getFullScreenItem(Product product, context) => InkWell(
    onTap: ()=>navigateToNext(context, DetailsScreen(product)),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              width: getWidth(context) ,
              height: 455.6,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image_link!),
                    fit: BoxFit.cover,
                  )),
            ),
            InkWell(
              onTap: () => null,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 5,),
         Text(product.name! , style:const TextStyle(
            height: 1.8, fontWeight: FontWeight.w400, fontSize: 20),
        ),
        SizedBox(
          width: getWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.product_type!,
                  style:const TextStyle(
                      height: 1.7,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.7,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Text(
                '\$ ${product.price!}',
                style:const TextStyle(
                    height: 1.7,
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0,overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        )
      ],
    ),
  );


}
/*
SizedBox(
                              width: (getWidth(context)/2)-25,
                              height: 328.0,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment:AlignmentDirectional.bottomEnd,
                                    children: [
                                      Container(
                                        width:getWidth(context)/2,
                                        height: 250,
                                        decoration:const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/images/shirt.jpg'),
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                      ),
                                      InkWell(
                                        onTap: ()=>null,
                                        child:const Padding(
                                          padding:  EdgeInsets.all(8.0),
                                          child: Icon(Icons.favorite_border_outlined,color: Colors.deepOrangeAccent,),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 4,),
                                  const Text('  21WIN',style: TextStyle(height: 1.5,
                                      fontWeight: FontWeight.w500,fontSize: 15
                                  ),),
                                  const Text('  reversibal argona cardibal',style: TextStyle(height: 1.5,
                                      fontWeight: FontWeight.w400,fontSize: 15
                                  ),),
                                  const Text('  \$120',style: TextStyle(height: 1.5,
                                      color: Colors.deepOrangeAccent,
                                      fontWeight: FontWeight.w500,fontSize: 17.0
                                  ),),
                                ],
                              ),
                            )
 */
