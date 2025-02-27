import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/route/Navigator.dart';
import '../../../../../core/utilies/ColorManager.dart';
import '../../../../../core/utilies/strings.dart';
import '../../../../../core/widget/Button.dart';
import '../../../../../core/widget/textform.dart';
import '../../../login/presentation/login.dart';

import '../controller/cubit.dart';
import '../controller/states.dart';
import '../widget/SingUpStatment.dart';
import 'completeSingUp.dart';


class SingUp extends StatelessWidget {

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingUpCubit,SingUpStates>(
      listener:(context,state){} ,
      builder:(context,state){
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeInUp(
                    duration:const Duration(seconds: 1),
                    child: SingUpStatement()),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //userName
                        CustomTextForm(
                            name: " userName",
                            preFixICon: Icons.person_outline,
                            controller:userNameController ,
                            keyboardType: TextInputType.text,
                            onFiledSubmitted: (value){},
                            validation:(value){
                              if(value!.isEmpty){
                                return Strings.userNameValidate;
                              }
                              return null;
                            }
                        ),
                        //email
                        CustomTextForm(
                            name: " Email",
                            preFixICon: Icons.email_outlined,
                            controller:emailController,
                            keyboardType: TextInputType.emailAddress,
                            onFiledSubmitted: (value){},
                            validation:(value){
                              if(value!.isEmpty){
                                return Strings.emailValidate;
                              }
                              return null;
                            }
                        ),
                        //password
                        CustomTextForm(
                          name: " Password",
                          preFixICon: Icons.lock_outlined,
                          controller:passwordController,
                          sufFixICon:SingUpCubit.of(context).hidePassword?Icons.visibility:Icons.visibility_off_outlined,
                          onTap: (){
                            SingUpCubit.of(context).changePassword();
                          },
                          hideInput:SingUpCubit.of(context).hidePassword,
                          onFiledSubmitted: (value){},
                          validation:(value){
                            if(value!.isEmpty){
                              return Strings.passwordValidate;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Button(
                            text: Strings.next,
                            width: double.infinity,
                            containerColor: ColorManager.secondaryColor,
                            onTap: (){
                              if(formKey.currentState!.validate()){
                                PushNavigation().navigation(
                                    context: context,
                                    screen: CompleteSingUp(
                                        userName: userNameController.text,
                                        email: emailController.text,
                                        password: passwordController.text
                                    ));
                              }
                            }
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextButton(
                    onPressed: (){
                      PushNavigation().navigation(context: context, screen: Login());
                    },
                    child: Text(
                      Strings.haveAnAccount ,
                      style: TextStyle(
                        color: ColorManager.textColor,
                        fontSize: 18.sp,
                      ),
                    )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
