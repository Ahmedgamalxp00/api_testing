import 'package:api_testing/core/erorrs/failures.dart';
import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PlanModel>>> getAllPlans();
}
