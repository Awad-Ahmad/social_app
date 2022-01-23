import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/Rigester/regiserstate.dart';

import 'RigeserCubit.dart';




//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class RigesterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var emailController =TextEditingController();
    var passordController =TextEditingController();
    var nameController =TextEditingController();
    var phoneController =TextEditingController();

    return BlocProvider(
      create:  (context)=> SocialRegisterCubit(),


        child: BlocConsumer<SocialRegisterCubit, SocialRegisterState>(
          listener: (context,state)
          {
            // if (state is shopsucssesRegisterlstate) {
            //   if (state.loginModel?.status == true) {
            //     print(state.loginModel?.message);
            //     print(state.loginModel?.data?.token);
            //     CashHelper.saveData(
            //         key: 'token', value: state.loginModel!.data!.token)
            //         .then((value) {
            //       token=state.loginModel?.data!.token;
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (context) => ShopLayout()));
            //     });
            //   } else {
            //     print(state.loginModel?.message);
            //     showToast(
            //         message: state.loginModel!.message.toString(),
            //         state: ToatStates.ERROR);
            //   }
            // }

          },
          builder: (context,state)
          {
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
                            "REGISTER",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "REGISTER now to communicate whith your freind  ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                {
                                  return "enter your name pleas";
                                }
                              }
                              //  return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide()),
                                prefixIcon: Icon(Icons.person),
                                hintText: " Name"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            //height: 30,
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
                            decoration: InputDecoration(
                                enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide()),
                                prefixIcon: Icon(Icons.person),
                                hintText: "Email Address"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passordController,
                            onFieldSubmitted: (value) {
                              // if (formkey.currentState!.validate())
                              // {
                              //   SocialRegisterCubit.get(context)..userLogin(
                              //       email: emailController.text,
                              //       password: passordController.text
                              //       ,name: nameController.text,
                              //     phone: phoneController.text
                              //   );
                              // }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                {
                                  return "eyour passord is too short ";
                                }
                              }
                            },
                            obscureText:
                            SocialRegisterCubit.get(context).isPasswordShown,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    SocialRegisterCubit
                                        .get(context)
                                        .changePasswordVisibilty();
                                  },
                                  icon:
                                  Icon( SocialRegisterCubit.get(context).suffix),
                                ),
                                enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide()),
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Password"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                {
                                  return "enter your name pleas";
                                }
                              }
                              //  return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide()),
                                prefixIcon: Icon(Icons.person),
                                hintText: " Name"),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: double.infinity,
                            child: ConditionalBuilder(
                              condition: state is!  SocialRegisterloadinglstate,
                              builder: (context) => MaterialButton(
                                   color: Colors.blue,
                                onPressed: () {
                                  // if (formkey.currentState!.validate()) {
                                  //   SocialRegisterCubit.get(context).userLogin(
                                  //       email: emailController.text,
                                  //       password: passordController.text,
                                  //       name: nameController.text,
                                  //   phone: phoneController.text
                                  //   );
                                  // }
                                },
                                child: Text(
                                  "Regester".toUpperCase(),
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


                          SizedBox(
                            height: 15,
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


