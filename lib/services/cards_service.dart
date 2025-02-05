import 'package:dio/dio.dart';
import 'package:mobile_app/models/card_model.dart';
import 'package:mobile_app/utils/error_handler.dart';

class CardsService {
  final Dio _dio;

  CardsService(this._dio);

  Future<List<CardModel>> getCards({
    required int idSet
  }) async {
    try {
      final Response response = await _dio.get('/cards/$idSet');
      return (response.data["data"] as List).map((e) => CardModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }

  Future<CardModel> addCardToCollection({
    required int idCard
  }) async {
    try {
      final Response response = await _dio.post("/cards/add-to-user/$idCard");
      return CardModel.fromJson(response.data["data"]);
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }

  Future<CardModel> removeCardFromCollection({
    required int idCard
  }) async {
    try {
      final Response response = await _dio.delete("/cards/remove-from-user/$idCard");
      return CardModel.fromJson(response.data["data"]);
    } catch (e) {
      throw ErrorHandler.getErrorMessage(e);
    }
  }
}
