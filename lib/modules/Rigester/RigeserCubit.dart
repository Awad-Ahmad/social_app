import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/Rigester/regiserstate.dart';


class SocialRegisterCubit extends Cubit< SocialRegisterState> {
  SocialRegisterCubit() : super( SocialRegisterinitalstate());

  static SocialRegisterCubit get(context) {
    return BlocProvider.of(context);
  }

  // void userLogin({required String email, required String password
  // ,required String name, required String phone
  // }) {
  //   emit( SocialRegisterloadinglstate());
  //   DioHelper.postData(url: REGISTER, data: {
  //     "email": email,
  //     "password": password,
  //     "name": name,
  //     "phone":phone
  //
  //
  //
  //   }, query: {}).then((value) {
  //     print(value.data);
  //     loginModel = ShopLoginModel.fromJson(value.data);
  //     print(loginModel?.data?.id);
  //     emit(shopsucssesRegisterlstate(loginModel));
  //   }
  //
  //   ).catchError((error)
  //   {
  //     print (error.toString());
  //     emit(shoperrorRegisterstate());
  //   });}
  //comit


  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;
//
  //hello from ahmad 0934961515
  // updation ahmad sssssssssssss
  //adonis
  // ddds mm mm mm mm mm mm mm mm mm mm
  // this is the test
  void changePasswordVisibilty() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown ? Icons.visibility_outlined : Icons.visibility_off;
    emit( SocialChangePasswordRegisterVisibiltyState());
  }
}
