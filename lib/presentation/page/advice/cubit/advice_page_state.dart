part of 'advice_page_cubit.dart';

@immutable
sealed class AdvicePageState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class AdvicePageEmpty extends AdvicePageState {}

class AdvicePageLoading extends AdvicePageState {}

class AdvicePageLoaded extends AdvicePageState {
  final AdviceEntity entity;

  AdvicePageLoaded({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class AdvicePageError extends AdvicePageState {}
