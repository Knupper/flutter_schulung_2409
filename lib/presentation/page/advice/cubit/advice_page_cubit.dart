import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_schulung/domain/use_case/advice_use_case.dart';

part 'advice_page_state.dart';

class AdvicePageCubit extends Cubit<AdvicePageState> {
  AdvicePageCubit({required this.useCase}) : super(AdvicePageEmpty());

  final AdviceUseCase useCase;

  Future<void> fetchAdvice() async {
    emit(AdvicePageLoading());
    final advice = await useCase.getAdvice();

    advice.when(
      (success) => emit(AdvicePageLoaded(entity: success)),
      (error) => emit(AdvicePageError()),
    );
  }
}
