import 'dart:convert';
import 'dart:io';

import 'package:flutter_schulung/data/models/advice_dto.dart';
import 'package:http/http.dart' as http;

abstract class AdviceDataSource with Read<AdviceDto> {
  @override
  Future<AdviceDto> read();
}

mixin Read<T> {
  Future<T> read();
}

class AdviceRestApi implements AdviceDataSource {
  final http.Client client;

  AdviceRestApi({required this.client});

  @override
  Future<AdviceDto> read() async {
    final response = await client.get(Uri.parse('https://api.flutter-community.com/api/v1/advice'), headers: {
      'accept': 'application/json',
    });

    if (response.statusCode != 200) {
      throw const HttpException('element not found');
    } else {
      final responseBody = json.decode(response.body);

      return AdviceDto.fromJson(responseBody);
    }
  }
}

class AdviceRestMock implements AdviceDataSource {
  AdviceRestMock();

  @override
  Future<AdviceDto> read() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => AdviceDto(id: 2, advice: 'Mock advice to test our ui'),
    );
  }
}
