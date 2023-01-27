import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pokemon_catcher/model/pokemon.dart';
import 'package:pokemon_catcher/model/sprites.dart';

abstract class RestApiServiceAbstract {
  Future getPockemon(String id);
}

class RestApiService implements RestApiServiceAbstract {
  const RestApiService(this._dio);

  final Dio _dio;

  @override
  Future<Either<Exception, Pokemon>> getPockemon(String id) async {
    try {
      final response = await _dio.get(
        'https://pokeapi.co/api/v2/pokemon/$id',
      );
      if (response.statusCode == 200) {
        return Either.right(
          Pokemon(
            id: response.data['id'],
            name: response.data['name'],
            order: response.data['order'],
            height: response.data['height'],
            weight: response.data['weight'],
            sprites: Sprites(
              frontDefault: response.data['sprites']['front_default'],
              frontShiny: response.data['sprites']['front_shiny'],
              backDefault: response.data['sprites']['back_default'],
              backShiny: response.data['sprites']['back_shiny'],
              other: Other(
                officialArtwork: OfficialArtwork(
                  frontDefault: response.data['sprites']['other']
                      ['official-artwork']['front_default'],
                  frontShiny: response.data['sprites']['other']
                      ['official-artwork']['front_shiny'],
                ),
              ),
            ),
          ),
        );
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
