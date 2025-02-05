import 'package:flutter/material.dart';
import 'package:mobile_app/models/collection_model.dart';
import 'package:mobile_app/services/collections_service.dart';

class CollectionsProvider extends ChangeNotifier {
  final CollectionsService _collectionsService;

  CollectionsProvider(this._collectionsService);

  bool _isLoading = false;
  String? _error;
  List<CollectionModel> _collections = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<CollectionModel> get collections => _collections;

  Future<void> fetchCollections() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _collections = await _collectionsService.getCollections();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
