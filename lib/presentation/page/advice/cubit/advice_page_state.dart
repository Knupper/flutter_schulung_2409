part of 'advice_page_cubit.dart';

@immutable
sealed class AdvicePageState {}

class AdvicePageEmpty extends AdvicePageState {}

class AdvicePageLoading extends AdvicePageState {}

class AdvicePageLoaded extends AdvicePageState {
  final AdviceEntity entity;

  AdvicePageLoaded({required this.entity});
}

class AdvicePageError extends AdvicePageState {}
