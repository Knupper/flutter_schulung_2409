import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/data/models/advice_dto.dart';
import 'package:flutter_schulung/data/repositories/advice_repo_impl.dart';
import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceDataSource>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return AdviceEntity', () {
      test('if DataSource returns valid AdviceDto', () async {
        final mockDataSource = MockAdviceDataSource();
        final repositoryUnderTest = AdviceRepoImpl(dataSource: mockDataSource);

        when(mockDataSource.read()).thenAnswer(
          (realInvocation) => Future.value(
            AdviceDto(id: 1, advice: 'test'),
          ),
        );

        final result = await repositoryUnderTest.getAdvice();

        expect(result.isError(), false);
        expect(result.isSuccess(), true);
        result.when(
          (success) => expect(success, AdviceEntity(advice: 'test')),
          (error) => fail('no failure should be here'),
        );

        // alternative: expect(result, Success<AdviceEntity, Failure>(AdviceEntity(advice: 'test')));

        verify(mockDataSource.read()).called(1);
        verifyNoMoreInteractions(mockDataSource);
      });
    });

    group('should return Failure', () {
      test('ServerFailure if HttpException was thrown', () {}, skip: true);
      test('UnknownFailure if Exception was thrown', () {}, skip: true);
    });
  });
}
