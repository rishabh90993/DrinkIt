import 'package:drink_it/Models/beer_data.dart';

class BeersStates {}

class LoadingState extends BeersStates {}

class UpdateState extends BeersStates {
  final List<BeerData> data;
  bool canLoadMore = true;
  UpdateState(this.data,this.canLoadMore);
}

class ErrorState extends BeersStates {
  String message;
  ErrorState(this.message);
}