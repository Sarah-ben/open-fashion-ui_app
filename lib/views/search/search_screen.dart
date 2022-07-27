import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    const SizedBox(
                      height: 27,
                        width: 27,
                        child:  Image(image: AssetImage('assets/images/search.jpg'))),
                    Expanded(child: defaultFormField(hint: 'Search Items',controller: TextEditingController())),
                    InkWell(
                      onTap: ()=>null,
                        child: const Icon(Icons.close))
                  ],
                ),
              const SizedBox(height: 20,),
              const Text('Popular search terms',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 20,),
              trendsItem('Trend'),
              trendsItem('Dress'),
              trendsItem('Bag'),
              trendsItem('Tshirt'),
              trendsItem('Beauty'),
              trendsItem('Accessories'),
            ],
          ),
        ),
      ),
    );
  }
}
