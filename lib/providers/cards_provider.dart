import 'package:flutter/material.dart';
import 'package:mobile_app/models/card_model.dart';
import 'package:mobile_app/services/cards_service.dart';

class CardsProvider extends ChangeNotifier {
  final CardsService _cardsService;

  CardsProvider(this._cardsService);

  bool _isLoading = false;
  String? _error;
  String? _addOrRemoveCardError;
  List<CardModel> _cards = [];
  int? _selectedCard;
  bool? _isInCollectionFilter;
  String _sortBy = "number";

  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get addOrRemoveCardError => _addOrRemoveCardError;
  List<CardModel> get cards {
    if (_isInCollectionFilter != null) {
      return _cards.where((e) => e.isInCollection == _isInCollectionFilter).toList();
    }
    return _cards;
  }
  int? get selectedCard => _selectedCard;
  bool? get isInCollectionFilter => _isInCollectionFilter;
  String get sortBy => _sortBy;

  set selectedCard(int? card) {
    _selectedCard = card;
    notifyListeners();
  }

  set isInCollectionFilter(bool? value) {
    _isInCollectionFilter = value;
    notifyListeners();
  }

  Future<void> fetchCards(int idSet) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _cards = await _cardsService.getCards(idSet: idSet);
      sortCards("number");
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void sortCards(String sort) {
    _sortBy = sort;
    notifyListeners();

    switch (sort) {
      case "number":
        _cards.sort((a, b) => a.number.compareTo(b.number));
        break;
      case "rarity":
        _cards.sort((a, b) => a.rarity.rank.compareTo(b.rarity.rank));
        break;
    }
    notifyListeners();
  }

  Future<void> addCardToCollection(int idCard) async {
    _addOrRemoveCardError = null;
    notifyListeners();
    try {
      final CardModel card = await _cardsService.addCardToCollection(idCard: idCard);
      _cards.firstWhere((e) => e.id == card.id).isInCollection = card.isInCollection;
    } catch (e) {
      _addOrRemoveCardError = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeCardFromCollection(int idCard) async {
    _addOrRemoveCardError = null;
    notifyListeners();
    try {
      final CardModel card = await _cardsService.removeCardFromCollection(idCard: idCard);
      _cards.firstWhere((e) => e.id == card.id).isInCollection = card.isInCollection;
    } catch (e) {
      _addOrRemoveCardError = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
