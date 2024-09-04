import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_schulung/domain/failure/failure.dart';
import 'package:flutter_schulung/domain/use_case/advice_use_case.dart';
import 'package:flutter_schulung/presentation/page/advice/cubit/advice_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

class MockAdviceUseCase extends Mock implements AdviceUseCase {}

void main() {
  group('AdvicePageCubit', () {
    group('should emit', () {
      MockAdviceUseCase mockUseCase = MockAdviceUseCase();

      blocTest(
        'no additional state on create',
        build: () => AdvicePageCubit(useCase: mockUseCase),
        expect: () => <AdvicePageState>[],
      );

      blocTest(
        'Loading and Loaded State if data loads',
        setUp: () {
          when(() => mockUseCase.getAdvice()).thenAnswer(
            (_) => Future.value(
              Success<AdviceEntity, Failure>(
                AdviceEntity(advice: 'test advice'),
              ),
            ),
          );
        },
        build: () => AdvicePageCubit(useCase: mockUseCase),
        act: (bloc) => bloc.fetchAdvice(),
        expect: () => <AdvicePageState>[
          AdvicePageLoading(),
          AdvicePageLoaded(entity: AdviceEntity(advice: 'test advice')),
        ],
      );

      blocTest(
        'Loading and Error State if data could not be loaded]',
        build: () => AdvicePageCubit(useCase: mockUseCase),
      );
    });
  });
}
