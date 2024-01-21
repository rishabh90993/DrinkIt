
import 'package:dio/dio.dart';

import 'interceptor/pretty_dio_logger.dart';

class DioHttpManager {

  static late Dio instance = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 50000),
      baseUrl: "https://api.punkapi.com/v2/",
  ))..interceptors.add(PrettyDioLogger(compact: true,responseBody: true));

}
