part of 'delete_plan_cubit.dart';

@immutable
sealed class DeletePlanState {}

final class DeletePlanInitial extends DeletePlanState {}

final class DeletePlanLoading extends DeletePlanState {}

final class DeletePlanSuccess extends DeletePlanState {}

final class DeletePlanFailure extends DeletePlanState {
  final String erorrMassage;

  DeletePlanFailure(this.erorrMassage);
}
