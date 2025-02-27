import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/route/Navigator.dart';
import '../../../../../core/utilies/ColorManager.dart';
import '../../../../../core/utilies/strings.dart';
import '../../../../../core/widget/Button.dart';
import '../../../../../core/widget/errorDialog.dart';
import '../../../../../core/widget/loading.dart';
import '../../../../../core/widget/textform.dart';
import '../../../../home/presentation/screen/Home.dart';
import '../../../login/presentation/login.dart';
import '../controller/cubit.dart';
import '../controller/states.dart';
import 'package:aiweather/core/di/di.dart' as di;


import '../widget/SingUpStatment.dart';

class CompleteSingUp extends StatefulWidget {

  final String userName;
  final String email;
  final String password ;

  CompleteSingUp({required this.userName, required this.email,required this.password});

  @override
  State<CompleteSingUp> createState() => _CompleteSingUpState();
}

class _CompleteSingUpState extends State<CompleteSingUp> {
  var birthDateController = TextEditingController();

  var heightController = TextEditingController();

  var weightController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>di.sl<SingUpCubit>(),
      child: BlocConsumer<SingUpCubit,SingUpStates>(
        listener: (context,state){
          if(state is SingUpSuccess){
            PushAndRemoveNavigation().navigation(context: context, screen: Home());
          }else if (state is SingUpFail){
            showDialog(context: context, builder:(context)=>errorAlertDialog(
                errorTittle:Strings.singUpError, errorMessage: state.message),
              barrierColor: ColorManager.primaryColor.withOpacity(.7)
            );
          }
        },
        builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FadeInUp(
                      duration: const Duration(seconds: 1),
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
                              name: " Birth Date",
                              preFixICon: Icons.person_outline,
                              controller:birthDateController ,
                              keyboardType: TextInputType.text,
                              onFiledSubmitted: (value){},
                              validation:(value){
                                if(value!.isEmpty){
                                  return Strings.birthDateValidate;
                                }
                                return null;
                              }
                          ),
                          //email
                          CustomTextForm(
                              name: " Height",
                              preFixICon: Icons.height,
                              controller:heightController,
                              keyboardType: TextInputType.number,
                              onFiledSubmitted: (value){},
                              validation:(value){}
                          ),
                          //password
                          CustomTextForm(
                            name: " Weight",
                            preFixICon: Icons.monitor_weight,
                            controller:weightController,
                            onTap: (){
                              SingUpCubit.of(context).changePassword();
                            },
                            onFiledSubmitted: (value){},
                            validation:(value){
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                         state is LoadingSingUp? Center(child: spinkit,): Button(
                             containerColor: ColorManager.secondaryColor,
                             text: Strings.next,
                             width: double.infinity,
                             onTap: (){
                               if(formKey.currentState!.validate()){
                                 SingUpCubit.of(context).singUp(
                                     userName: widget.userName,
                                     email: widget.email,
                                     password: widget.password,
                                     birthDate: birthDateController.text,
                                     height: heightController.text,
                                     weight: weightController.text,
                                     context: context);
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
        }

    ));
  }
}