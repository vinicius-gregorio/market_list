//import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:market_list/app/shared/services/models/market_list_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorageService extends Disposable {
  //dispose will be called automatically
  Completer<Box> completer = Completer<Box>();

  LocalStorageService() {
    _initDatabase();
  }
  _initDatabase() async {
    final path = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(path.path);
    final box = await Hive.openBox('market');
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<List<MarketListModel>> getAll() async {
    final box = await completer.future;
    return box.values.map((e) => MarketListModel.fromJson(e)).toList();
  }

  Future<MarketListModel> addItem(MarketListModel model) async {
    final box = await completer.future;
    model.id = box.values.length;
    await box.put(box.values.length, model.toJson());
    return model;
  }

  deleteItem(int id) async {
    final box = await completer.future;
    await box.delete(id);
  }

  updateItem(MarketListModel model) async {
    final box = await completer.future;
    await box.put(model.id, model.toJson());
  }

  @override
  void dispose() async {
    final box = await completer.future;
    box.close();
  }
}
