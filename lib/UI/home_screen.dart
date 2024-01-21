import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/Utils/constants/app_colors.dart';
import 'package:drink_it/Utils/constants/app_text_styles.dart';
import 'package:drink_it/bloc/beer/beers_bloc.dart';
import 'package:drink_it/bloc/beer/beers_events.dart';
import 'package:drink_it/service/beer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Utils/scroll_utils.dart';
import 'beer_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<BeerData> beerList = [];
  bool canLoadMore = true;

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (shouldPaginateFromController(_scrollController) && canLoadMore) {
          BlocProvider.of<BeersBloc>(context).add(GetBeersEvent());
        }
      });
    super.initState();
  }

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
              GestureDetector(
                onTap: (){
                  context.go("/home/profile");
                },
                child: const SizedBox(
                  height: 32,
                  width: 32,
                  child: Icon(Icons.account_box_rounded,color: AppColors.whiteColor,size: 40,),
                ),
              ),
              const SizedBox(height: 30,),
              Text("Time to Cheers! Choose your beer...",style: AppTextStyles.bodyText16.copyWith(
                color: AppColors.grayTextColor,
                fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 10,),

              BlocProvider<BeersBloc>(
                create: (context) => BeersBloc(BeerService())..add(GetBeersEvent()),
                child: BeerListWidget(),
              )
            ],
        ),
      ),
    );
  }
}
