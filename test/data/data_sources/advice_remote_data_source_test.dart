import 'dart:io';

import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_remote_data_source_test.mocks.dart';

/// to generate mocks run 'flutter pub run build_runner build'
@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group(
    'AdviceRestApi',
    () {
      group('should return AdviceDto', () {
        test('if client response was 200 and has valid data', () async {
          final mockClient = MockClient();

          final dataSource = AdviceRestApi(client: mockClient);
          const responseBody = '{"advice": "test advice", "advice_id": 1}';

          when(
            mockClient.get(
              Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: anyNamed('headers'),
            ),
          ).thenAnswer((realInvocation) => Future.value(Response(responseBody, 200)));

          final result = await dataSource.read();

          expect(result.advice, 'test advice');
          expect(result.id, 1);
        });
      });

      group('should throw', () {
        test('HttpException if client returns statusCode != 200', () {
          final mockClient = MockClient();

          final dataSource = AdviceRestApi(client: mockClient);

          when(
            mockClient.get(
              Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: anyNamed('headers'),
            ),
          ).thenAnswer((realInvocation) => Future.value(Response('', 404)));

          expect(dataSource.read, throwsA(isA<HttpException>()));
        });

        test('SocketException if client throws exception', () {
          final mockClient = MockClient();

          final dataSource = AdviceRestApi(client: mockClient);

          when(
            mockClient.get(
              Uri.parse('https://api.flutter-community.com/api/v1/advice'),
              headers: anyNamed('headers'),
            ),
          ).thenThrow(const SocketException('exception'));

          expect(dataSource.read, throwsA(isA<SocketException>()));
        });
      });
    },
  );
}
