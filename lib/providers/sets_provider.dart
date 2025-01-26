import 'package:flutter/material.dart';
import 'package:mobile_app/models/set_model.dart';
import 'package:mobile_app/services/sets_service.dart';

class SetsProvider extends ChangeNotifier {
  final SetsService _setsService;

  SetsProvider(this._setsService);

  bool _isLoading = false;
  String? _error;
  List<SetModel> _sets = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<SetModel> get sets => _sets;

  Future<void> fetchSets(int idCollection) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _sets = await _setsService.getSets(idCollection: idCollection);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
