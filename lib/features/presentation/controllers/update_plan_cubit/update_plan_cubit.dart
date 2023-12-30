import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_plan_state.dart';

class UpdatePlanCubit extends Cubit<UpdatePlanState> {
  UpdatePlanCubit(this.homeRepo) : super(UpdatePlanInitial());
  final HomeRepo homeRepo;

  Future<void> updatePlan({required PlanModel plan, required int id}) async {
    emit(UpdatePlanInitial());
    var result = await homeRepo.updetePlan(plan: plan, id: id);
    result.fold((failure) {
      emit(UpdatePlanFailure(failure.erorrMassage));
    }, (data) {
      emit(UpdatePlanSuccess());
    });
  }
}
