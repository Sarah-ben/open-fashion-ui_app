import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/shared/Cubit/app_cubit.dart';
import 'package:open_fashion/shared/Cubit/app_states.dart';
import 'package:open_fashion/shared/network/dio_helper.dart';
import 'package:open_fashion/views/OnBoarding/onBoarding_screen.dart';
import 'package:open_fashion/views/blog/blog_post_screen.dart';
import 'package:open_fashion/views/blog/blogs_screen.dart';
import 'package:open_fashion/views/contact_us/contactus_screen.dart';
import 'package:open_fashion/views/favorites/favorites_screen.dart';
import 'package:open_fashion/views/home/home_screen.dart';
import 'package:open_fashion/views/ourStory/ourstory_screen.dart';
import 'package:open_fashion/views/product_details/details_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  HttpOverrides.global =  MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create:  (BuildContext context)=>AppCubit()..getProduct(),
    child:BlocConsumer<AppCubit,AppStates>(builder:(context,state){return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          appBarTheme:const AppBarTheme(backgroundColor:Colors.white,elevation: 0 ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const OnBoardingScreen(),
      );
    } ,listener: (context,state){},) ,);
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

