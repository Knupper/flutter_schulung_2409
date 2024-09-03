import 'dart:io';

import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_schulung/domain/failure/failure.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceDataSource dataSource;

  AdviceRepoImpl({required this.dataSource});

  @override
  Future<Result<AdviceEntity, Failure>> getAdvice() async {
    try {
      final result = await dataSource.read();
      return Success(AdviceEntity(advice: result.advice));
    } on HttpException catch (_) {
      return Error(ServerFailure());
    } catch (_) {
      return Error(UnknownFailure());
    }
  }
}
