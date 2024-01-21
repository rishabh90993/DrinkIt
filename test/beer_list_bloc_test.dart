import 'package:bloc_test/bloc_test.dart';
import 'package:drink_it/Models/beer_data.dart';
import 'package:drink_it/bloc/beer/beers_bloc.dart';
import 'package:drink_it/bloc/beer/beers_events.dart';
import 'package:drink_it/bloc/beer/beers_states.dart';
import 'package:drink_it/service/i_beer_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBeerService extends Mock implements IBeerService {}

void main() {
  group('BeersBloc', () {
    late BeersBloc myBloc;
    late MockBeerService mockedService;

    setUp(() {
      mockedService = MockBeerService();
      myBloc = BeersBloc(mockedService!);
    });

    tearDown(() {
      myBloc.close();
    });

    blocTest(
      'emits [UpdateState] when GetBeersEvent is added successfully',
      build: () {
        when(mockedService.getBeers(page: 1,perPage: 10)).thenAnswer((_) async => [BeerData()]);
        return myBloc;
      },
      act: (bloc) => bloc.add(GetBeersEvent()),
      expect: () => [emitsInAnyOrder([isA<LoadingState>(),isA<UpdateState>(),])],
    );

    blocTest(
      'emits [ErrorState] when FetchDataEvent fails',
      build: () {
        when(mockedService.getBeers(page: 1,perPage: 10)).thenThrow(Exception('Failed to fetch data'));
        return myBloc;
      },
      act: (bloc) => bloc.add(GetBeersEvent()),
      expect: () => [emitsInAnyOrder([isA<LoadingState>(),isA<ErrorState>(),])],
    );

  });
}