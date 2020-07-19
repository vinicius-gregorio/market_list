import 'package:market_list/app/shared/services/local_storage_service.dart';
import 'package:market_list/app/shared/services/models/market_list_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LocalStorageService service;
  _HomeControllerBase(this.service);

  _init() async {
    final allList = await service.getAll();
    list.addAll(allList);
  }

  @action
  add(MarketListModel model) async {
    await service.addItem(model);
    list.add(model);
  }

  @action
  delete(MarketListModel model) async {
    await service.deleteItem(model.id);
    list.remove(model);
  }

  @observable
  ObservableList<MarketListModel> list = ObservableList<MarketListModel>();
}
