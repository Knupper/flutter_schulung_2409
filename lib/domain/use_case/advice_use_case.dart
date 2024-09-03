import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_schulung/domain/failure/failure.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AdviceUseCase {
  final AdviceRepo repository;

  AdviceUseCase({required this.repository});

  Future<Result<AdviceEntity, Failure>> getAdvice() {
    return repository.getAdvice();
  }
}
