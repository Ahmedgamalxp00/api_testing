part of 'add_plan_cubit.dart';

@immutable
sealed class AddPlanState {}

final class AddPlanInitial extends AddPlanState {}

final class AddPlanLoading extends AddPlanState {}

final class AddPlanSuccess extends AddPlanState {}

final class AddPlanFailure extends AddPlanState {
  final String erorrMassage;

  AddPlanFailure(this.erorrMassage);
}
