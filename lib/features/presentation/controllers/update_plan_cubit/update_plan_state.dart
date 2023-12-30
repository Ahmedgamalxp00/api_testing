part of 'update_plan_cubit.dart';

@immutable
sealed class UpdatePlanState {}

final class UpdatePlanInitial extends UpdatePlanState {}

final class UpdatePlanLoading extends UpdatePlanState {}

final class UpdatePlanSuccess extends UpdatePlanState {}

final class UpdatePlanFailure extends UpdatePlanState {
  final String erorrMassage;

  UpdatePlanFailure(this.erorrMassage);
}
