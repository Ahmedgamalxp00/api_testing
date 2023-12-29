part of 'plans_cubit.dart';

@immutable
sealed class PlansState {}

final class PlansInitial extends PlansState {}

final class PlansLoading extends PlansState {}

final class PlansSuccess extends PlansState {
  final List<PlanModel> plans;
  PlansSuccess(this.plans);
}

final class PlansFailure extends PlansState {
  final String erorrMassage;

  PlansFailure(this.erorrMassage);
}
