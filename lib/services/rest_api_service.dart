import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_catcher/model/pokemon.dart';

abstract class RestApiServiceAbstract {
  Future getPockemon(int id);
}

class RestApiService implements RestApiServiceAbstract {
  const RestApiService(this._dio);

  final Dio _dio;

  @override
  Future<Either<Exception, Pokemon>> getPockemon(int id) async {
    try {
      final response = await _dio.get(
        'https://pokeapi.co/api/v2/pokemon/$id',
      );
      if (response.statusCode == 200) {
        return Either.right(
            Pokemon.fromMap(response.data as Map<String, dynamic>));
      } else {
        return Either.left(Exception(response.statusMessage.toString()));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.other && e.error is SocketException) {
        throw Exception('No Internet Connection');
      } else if (e.response != null) {
        debugPrint('there was an error: ${e.response!.statusCode}');
        throw Exception(e.response?.statusCode);
      } else {
        debugPrint('there was an error: ${e.toString()}');
        rethrow;
      }
    }
  }
}
