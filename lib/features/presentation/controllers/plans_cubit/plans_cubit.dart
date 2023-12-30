import 'package:api_testing/features/data/models/channel/channel.model.dart';
import 'package:api_testing/features/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  PlansCubit(this.homeRepo) : super(PlansInitial());

  final HomeRepo homeRepo;
  late List<dynamic> productList;
  Future<void> getAllPlans() async {
    emit(PlansLoading());
    var result = await homeRepo.getAllPlans();
    result.fold((failure) {
      emit(PlansFailure(failure.erorrMassage));
    }, (plans) {
      productList = plans;
      emit(PlansSuccess(plans));
      @override
      Future<void> close() {
        return super.close();
      }
    });
  }
}
