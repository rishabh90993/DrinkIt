import 'package:drink_it/UI/beer_grid_item.dart';
import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:drink_it/Utils/constants/app_images.dart';
import 'package:drink_it/Utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackBackgroundColor,
      body: Padding(
        padding:  EdgeInsets.only(left: 21,right: 21,
            top: 15 + MediaQuery.of(context).viewPadding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
                width: 32,
                child: Icon(Icons.account_box_rounded,color: AppColors.whiteColor,size: 40,),
              ),
              const SizedBox(height: 30,),
              Text("Time to Cheers! Choose your beer...",style: AppTextStyles.bodyText16.copyWith(
                color: AppColors.grayTextColor,
                fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 10,),
              Expanded(child: _gridView())
            ],
        ),
      ),
    );
  }

  _gridView() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 15.0,
      childAspectRatio: 0.55
    ),
    padding: EdgeInsets.only(top: 20,bottom: 20 + MediaQuery.of(context).viewPadding.bottom),
    itemCount: 10,
    itemBuilder: (context, index) {
      return const BeerGridItem();
    },
  );
}
