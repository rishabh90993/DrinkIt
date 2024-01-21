import 'package:drink_it/Models/beer_data.dart';

mixin IBeerService {
  Future<List<BeerData>> getBeers({
    required int page,
    int perPage
  });
}
