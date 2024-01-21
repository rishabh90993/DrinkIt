import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/bloc/beer/beers_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Utils/constants/app_colors.dart';
import '../Utils/constants/app_text_styles.dart';
import '../Utils/scroll_utils.dart';
import '../bloc/beer/beers_bloc.dart';
import '../bloc/beer/beers_events.dart';
import 'beer_grid_item.dart';

class BeerListWidget extends StatefulWidget {
  BeerListWidget({super.key});

  @override
  State<BeerListWidget> createState() => _BeerListWidgetState();
}

class _BeerListWidgetState extends State<BeerListWidget> {

  List<BeerData> beerList = [];
  bool canLoadMore = true;

  late ScrollController _scrollController;
  late BeersBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<BeersBloc>();
    _scrollController = ScrollController()
      ..addListener(() {
        if (shouldPaginateFromController(_scrollController) && canLoadMore) {
          canLoadMore = false;
          context.read<BeersBloc>().add(GetBeersEvent());
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeersBloc, BeersStates>(
      builder: (context, state) {
        if (state is LoadingState) {
          return _loadingWidget(context);
        }
        if (state is UpdateState) {
          beerList.addAll(state.data);
          canLoadMore = state.canLoadMore;
          return Expanded(child: _gridWidget());
        }
        if(state is ErrorState) {
          return _errorWidget(context);
        }
        return Container();
      },
    );
  }

  _gridWidget() => CustomScrollView(
    physics: BouncingScrollPhysics(),
    controller: _scrollController,
    slivers: [

      CupertinoSliverRefreshControl(
        onRefresh: () => refreshList(),
      ),

      SliverPadding(
        padding: EdgeInsets.only(top: 20,bottom: 20 + MediaQuery.of(context).viewPadding.bottom),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 15.0,
            childAspectRatio: 0.55,
          ),
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  context.go("/home/productDetails",extra: beerList[index]);
                },
                child: BeerGridItem(beerData: beerList[index],)
            );
          },
            childCount: beerList.length,
          ),
        ),
      ),

      SliverToBoxAdapter(
        child: Visibility(
          visible: canLoadMore,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      )
    ],
  );

  _loadingWidget(BuildContext context) =>  const Expanded(
    child: Center(
        child: CircularProgressIndicator()),
  );

  _errorWidget(BuildContext context) => Expanded(
    child: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error in Loading Data.",style: AppTextStyles.bodyText14.copyWith(color: AppColors.grayTextColor),),
        TextButton(
          onPressed: (){
            refreshList();
          },
          child: Text("Refresh",style: AppTextStyles.bodyText18.copyWith(color: AppColors.whiteColor),),
        )
      ],
    )),
  );

  refreshList() async {
    _bloc.page = 1;
    beerList.clear();
    _bloc.add(GetBeersEvent());
  }

}
