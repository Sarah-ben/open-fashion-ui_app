import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_fashion/shared/components/components.dart';

class OurStory extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            SizedBox(
              height: 20,
            ),
            const Text(
              'OUR STORY',
              style: TextStyle(height: 1.8, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Open Fashion - Free Ecommerce UI Kit is a free download UI kit. You can open Open Fashion - Free Ecommerce UI Kit file by Figma. Create stunning shop with bulletproof guidelines and thoughtful components.\n \nIts library contains more than 50+ components supporting Light & Dark Mode and 60+ ready to use mobile screens.\n',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            Image.asset('assets/images/ourstory.jpg'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'SIGN UP',
              style: TextStyle(height: 1.8, fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Receive early access to new arrivals,sales , exclusive content , events and much more!',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            defaultFormField(
                controller: emailController, hint: 'Email address'),
            const SizedBox(
              height: 5,
            ),
            defaultFormField(controller: nameController, hint: 'Username'),
            SizedBox(
              height: 5,
            ),
            defaultFormField(controller: passwordController, hint: 'Password'),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
                context: context,
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
