import 'package:api_testing/core/erorrs/failures.dart';
import 'package:api_testing/core/utils/api_services.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<PlanModel>>> getAllPlans() async {
    try {
      var data = await apiService.get(endpoint: '');
      List<PlanModel> plans = [];
      for (var item in data['data']) {
        plans.add(PlanModel.fromJson(item));
      }
      return right(plans);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
