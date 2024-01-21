
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/network/app_http_manager.dart';
import 'package:drink_it/service/i_beer_service.dart';

class BeerService implements IBeerService {

  @override
  Future<List<BeerData>> getBeers({required int page, int perPage = 10}) async {
    Response response = await DioHttpManager.instance.get("beers",queryParameters: {
      "page":page,
      "per_page":perPage
    });

    if(response.statusCode! >= 200 && response.statusCode! < 305){
      return (response?.data as List).map((i) =>
          BeerData.fromJson(i)).toList();
    }else{
      throw Exception("Error in fetching Data.");
    }
  }

}
