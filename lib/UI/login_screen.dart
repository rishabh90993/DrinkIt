import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:drink_it/Utils/constants/app_images.dart';
import 'package:drink_it/Utils/constants/app_text_styles.dart';
import 'package:drink_it/Utils/wdg_snackbar.dart';
import 'package:drink_it/bloc/login/login_bloc.dart';
import 'package:drink_it/bloc/login/login_events.dart';
import 'package:drink_it/bloc/login/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackgroundColor,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: Builder(
          builder: (context) {
            return BlocListener<LoginBloc,LoginStates>(
              listener: (BuildContext context,LoginStates state) {
                if(state is LoginSuccessState){
                  context.go("/home");
                }
                if(state is ErrorState){
                  showSnackBar(state.message, context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
                child: Column(
                  children: [
                    Expanded(child: Image.asset(Appimages.beerLogo,width: 300,height: 300,)),
                    GestureDetector(
                      onTap: (){
                        context.read<LoginBloc>().add(GoogleLoginEvent(context));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        padding:  const EdgeInsets.symmetric(vertical: 13 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            // Loading png because svg not loading because of some issue.
                            Padding(
                              padding: const EdgeInsets.only(left:80),
                              child: SvgPicture.asset(Appimages.googleLogo,width: 30,height: 30,),
                            ),
                            const Text("Google",style: AppTextStyles.bodyText14,),
                            const SizedBox(width: 80,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
