import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:drink_it/Utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageWidget(),
          _profileDetailsWidget(),
        ],
      ),
    );
  }

  _imageWidget() => Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: AppColors.blackBackgroundColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
        ),
        margin: const EdgeInsets.only(bottom: 100),
        padding:  EdgeInsets.only(left: 21,right: 21,
          top: 15 + MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap:(){
                context.pop();
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(6))
                ),
                child: const Icon(Icons.arrow_back,color: AppColors.blackColor,size: 24,),
              ),
            ),
            SizedBox(height: 180 + MediaQuery.of(context).viewPadding.top,),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg",
                height: 267,width: 267,
                fit: BoxFit.cover,
              )
          ),
      )
    ],
  );

  _profileDetailsWidget() => Expanded(
    child: Container(
      margin: const EdgeInsets.only(top: 40),
      padding:  const EdgeInsets.only(left: 21,right: 21,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w700,color: AppColors.grayTextColor),),
              const SizedBox(height: 11,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.grayLightBackgroundColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Text("Mark Wood",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w700))),
              const SizedBox(height: 20,),
              Text("Email Id",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w700,color: AppColors.grayTextColor),),
              const SizedBox(height: 11,),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.grayLightBackgroundColor,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Text("johndoe@yopmail.com",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w700))),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 30,top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.red, width: 1),
                ),
                backgroundColor: Colors.red,
                elevation: 0,
              ),
              onPressed: () {

              },
              child: Container(
                height: 70,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text("Logout",style: AppTextStyles.bodyText16.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700
                ),),
              ),
            ),
          )
        ],
      ),
    ),
  );

}
