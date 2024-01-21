
import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/bloc/beer/beers_events.dart';
import 'package:drink_it/service/beer_service.dart';
import 'package:drink_it/service/i_beer_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'beers_states.dart';

class BeersBloc extends Bloc<BeersEvents, BeersStates> {

  IBeerService service;
  int page = 1;

  BeersBloc(this.service) : super(LoadingState()) {
    on<GetBeersEvent>(callCurrencyApi);
  }

  void callCurrencyApi(GetBeersEvent event, Emitter<BeersStates> emit) async {
    if(page==1) emit(LoadingState());
    try{
      List<BeerData> response = await service.getBeers(page: page,perPage: 10);
      page++;
      emit(UpdateState(response,response.isNotEmpty));
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }

}