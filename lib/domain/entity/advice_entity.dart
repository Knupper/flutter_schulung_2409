import 'package:equatable/equatable.dart';

class AdviceEntity with EquatableMixin {
  final String advice;

  AdviceEntity({required this.advice});

  @override
  List<Object?> get props => [advice];
}
