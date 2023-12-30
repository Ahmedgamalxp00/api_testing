import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_plan_state.dart';

class AddPlanCubit extends Cubit<AddPlanState> {
  AddPlanCubit(this.homeRepo) : super(AddPlanInitial());
  final HomeRepo homeRepo;

  Future<void> addPlan({required PlanModel plan}) async {
    emit(AddPlanLoading());
    var result = await homeRepo.addPlan(plan: plan);
    result.fold((failure) {
      emit(AddPlanFailure(failure.erorrMassage));
    }, (data) {
      emit(AddPlanSuccess());
    });
  }
}
