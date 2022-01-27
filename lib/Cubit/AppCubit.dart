import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Cubit/AppStets.dart';

import 'AppStets.dart';

class AppLoginCubit extends Cubit<AppState>
{
  AppLoginCubit() : super(AppInialSatate());
  static AppLoginCubit  get(context)
  {
   return BlocProvider.of(context);
  }
  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibilty() {
    isPasswordShown = ! isPasswordShown;
    suffix = isPasswordShown ? Icons.visibility_outlined : Icons.visibility_off;
    emit(AppLoginChangePasswordVisibiltyState());
  }

}
