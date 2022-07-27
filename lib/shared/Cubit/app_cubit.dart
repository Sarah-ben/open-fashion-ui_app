import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/models/products_model.dart';
import 'package:open_fashion/shared/network/dio_helper.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  late Product productModel;
  List<Product>products=[];
  getProduct(){
    DioHelper.getData(url: 'products.json')
        .then((value) {
          for(int i=0;i<931;i++)
            {
              productModel=Product.fromJson(value.data[i]);
              products.add(productModel);
            }
          print(products.length);
          //print(value.data[1]);
          //
          emit(GetProductSuccessState());
    }).catchError((onError){
      emit(GetProductErrorState(onError));
      print(onError);
    });
  }

}