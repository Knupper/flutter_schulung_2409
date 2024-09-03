import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_schulung/domain/failure/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AdviceRepo {
  Future<Result<AdviceEntity, Failure>> getAdvice();
}
