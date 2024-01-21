import 'package:cached_network_image/cached_network_image.dart';
import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:drink_it/Utils/constants/app_images.dart';
import 'package:drink_it/Utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class BeerGridItem extends StatelessWidget {
  BeerData beerData;
  BeerGridItem({Key? key, required this.beerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            imageWidget(),
            Container(
              color: AppColors.whiteColor,
              height: 150,
              child: _descriptionWidget(),
            )
          ],
        ),
      ),
    );
  }

  imageWidget() => SizedBox(
    height: 150,
    child: Stack(
      alignment: Alignment.center,
        children: [
          Image.asset(Appimages.beerImageBackground,height: 150,fit: BoxFit.cover,),
          Container(height: 150,color: AppColors.blackColor.withOpacity(0.65),),
          Positioned(
              bottom: 5,
              child: Column(
                children: [
                  CachedNetworkImage(imageUrl: beerData.imageUrl ?? "",height: 105,fit: BoxFit.fitHeight,),
                  const SizedBox(height: 7,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 1),
                    decoration: const BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    child: Text("First Brewed : ${beerData.firstBrewed ?? ""}",style: AppTextStyles.bodyText12.copyWith(
                      color: AppColors.whiteColor,
                    ),),
                  )
                ],
              ))
        ],
    ),
  );

  _descriptionWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(beerData.name ?? "",style: AppTextStyles.bodyText14.copyWith(fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 7,),
        Text(beerData.description ?? "",
          style: AppTextStyles.bodyText12.copyWith(color: AppColors.grayTextColor),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12,),
        Row(
          children: [
            _titleTextWidget("ABV",(beerData.abv ?? 0).toString()),
            const SizedBox(width: 5,),
            _titleTextWidget("IBU",(beerData.ibu ?? 0).toString()),
          ],
        )
      ],
    ),
  );

  _titleTextWidget(String title, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: AppTextStyles.bodyText12.copyWith(fontWeight: FontWeight.w500),),
      Text(value, style: AppTextStyles.bodyText12.copyWith(color: AppColors.grayTextColor),),
    ],
  );
}
