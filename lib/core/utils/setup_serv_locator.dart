import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/network/api_services.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  // علشان لما اجي استخدمها في ايي فيتشر عندي هنستخدمها في كل ريبو
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
}
