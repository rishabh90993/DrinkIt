import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:drink_it/Utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../Utils/constants/app_text_styles.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key? key,required this.beerData}) : super(key: key);
  BeerData beerData;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _nameAndImageWidget(),
            _descriptionWidget()
          ],
        ),
      ),
    );
  }

  _nameAndImageWidget() => Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
            color: AppColors.blackBackgroundColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
        ),
        margin: const EdgeInsets.only(bottom: 70),
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
            const SizedBox(height: 30,),
            Text(widget.beerData.name ?? "",style: AppTextStyles.bodyText16.copyWith(
                color: AppColors.grayTextColor,
                fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 12,),
            Text(widget.beerData.brewersTips ?? "",style: AppTextStyles.bodyText14.copyWith(color: AppColors.grayTextColor)),
            const SizedBox(height: 180,),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: 160,
          height: 230,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: AppColors.grayBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: CachedNetworkImage(imageUrl: widget.beerData.imageUrl ?? "",height: 200,fit: BoxFit.fitHeight,),
        ),
      )
    ],
  );

  _descriptionWidget() => Container(
    padding:  const EdgeInsets.only(left: 21,right: 21,top: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w500),),
        const SizedBox(height: 11,),
        Text(widget.beerData.description ?? "",style: AppTextStyles.bodyText14.copyWith(color: AppColors.grayTextColor)),
        const SizedBox(height: 22,),
        Text("First Brewed",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w500),),
        const SizedBox(height: 11,),
        Text(widget.beerData.firstBrewed ?? "",style: AppTextStyles.bodyText14.copyWith(color: AppColors.grayTextColor)),
        const SizedBox(height: 22,),
        Text("Getting know your beer better",style: AppTextStyles.bodyText16.copyWith(fontWeight: FontWeight.w500),),
        const SizedBox(height: 22,),

        Row(
          children: [
            _titleDescriptionWidget("ABV",(widget.beerData.abv ?? 0).toString()),
            _titleDescriptionWidget("IBU",(widget.beerData.ibu ?? 0).toString())
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          children: [
            _titleDescriptionWidget("TARGET FG",(widget.beerData.targetFg ?? 0).toString()),
            _titleDescriptionWidget("TARGET OG",(widget.beerData.targetOg ?? 0).toString())
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          children: [
            _titleDescriptionWidget("EBC",(widget.beerData.ebc ?? 0).toString()),
            _titleDescriptionWidget("SRM",(widget.beerData.srm ?? 0).toString())
          ],
        ),
        const SizedBox(height: 22,),
        Row(
          children: [
            _titleDescriptionWidget("PH",(widget.beerData.ph ?? 0).toString()),
            _titleDescriptionWidget("ATTENTION LEVEL",(widget.beerData.attenuationLevel ?? 0).toString())
          ],
        ),
        const SizedBox(height: 40,),
        // GridView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 5,
        //       crossAxisSpacing: 5,
        //       childAspectRatio: 3
        //   ),
        //   padding: const EdgeInsets.only(bottom: 29),
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return _titleDescriptionWidget("ABV",(widget.beerData.abv ?? 0).toString());
        //   },
        // )

      ],
    ),
  );

  _titleDescriptionWidget(String title, String value) => Expanded(
    flex: 1,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
            decoration: const BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: Center(child: SvgPicture.asset(Appimages.cheersIcon,height: 24,width: 24,))),
        const SizedBox(width: 11,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: AppTextStyles.bodyText12.copyWith(fontWeight: FontWeight.w500,letterSpacing: 1),),
            Text(value, style: AppTextStyles.bodyText12.copyWith(color: AppColors.grayTextColor),),
          ],
        ),
      ],
    ),
  );

}
