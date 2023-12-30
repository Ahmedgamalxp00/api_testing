import 'package:api_testing/features/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_plan_state.dart';

class DeletePlanCubit extends Cubit<DeletePlanState> {
  DeletePlanCubit(this.homeRepo) : super(DeletePlanInitial());
  final HomeRepo homeRepo;

  Future<void> deletePlan({required int id}) async {
    emit(DeletePlanLoading());
    var result = await homeRepo.deletePlan(id: id);
    result.fold((failure) {
      emit(DeletePlanFailure(failure.erorrMassage));
    }, (data) {
      emit(DeletePlanSuccess());
    });
  }
}
