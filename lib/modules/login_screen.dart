import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Cubit/AppCubit.dart';
import 'package:social_app/Cubit/AppStets.dart';

import 'Rigester/rigester_scrren.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formkey=GlobalKey<FormState>();
    var emailController = TextEditingController();

    var passordController = TextEditingController();
    return  BlocProvider(
      create:  (context)=>AppLoginCubit(),

      child: BlocConsumer<AppLoginCubit,AppState>(
        listener: (context,state ){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black
                          ),
                        ), Text(
                          "Login now to communiciate  with your Firend  ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              {
                                return "enter your email pleas";
                              }
                            }
                            //  return null;
                          },
                          decoration: const InputDecoration(
                              enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide()),
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: "Email Address"),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: passordController,
                          // onFieldSubmitted: (value) {
                          //   if (formkey.currentState!.validate()) {
                          //     AppLoginCubit.get(context).userLogin(
                          //         email: emailController.text,
                          //         password: passordController.text);
                          //   }
                          // },
                          // keyboardType: TextInputType.visiblePassword,
                          // validator: (String? value) {
                          //   if (value!.isEmpty) {
                          //     {
                          //       return "eyour passord is too short ";
                          //     }
                          //   }
                          // }

                          obscureText:
                          AppLoginCubit.get(context).isPasswordShown,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  AppLoginCubit
                                      .get(context)
                                      .changePasswordVisibilty();
                                },
                                icon:
                                Icon(AppLoginCubit.get(context).suffix),
                              ),
                              enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide()),
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Password"),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ConditionalBuilder(
                            condition: state is! AppLgoingLoadingState,
                            builder: (context) => MaterialButton(
                              color: Colors.blue,
                              onPressed: () {
                                // if (formkey.currentState!.validate()) {
                                //   AppLoginCubit.get(context).userLogin(
                                //       email: emailController.text,
                                //       password: passordController.text);
                                // }
                              },
                              child: Text(
                                "login".toUpperCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            fallback: (BuildContext context) {
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ? "),
                            TextButton(
                                onPressed: ()
                              {
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RigesterScreen()));

                              },
                                ///onPressed: () {  },
                                child: Text("register now".toUpperCase()))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
