import 'package:mobx/mobx.dart';
part 'market_list_model.g.dart';

class MarketListModel extends _MarketListModel with _$MarketListModel {
  MarketListModel(
      {int id, String product, bool check = false, String description})
      : super(id: id, product: product, description: description, check: check);

  toJson() {
    return {'product': product, 'description': description, 'check': check};
  }

  MarketListModel.fromJson(Map json) {
    product = json['product'];
    description = json['description'];
    check = json['check'];
    id = json['id'];
  }
}

abstract class _MarketListModel with Store {
  int id;
  @observable
  String product;
  @observable
  String description;
  @observable
  bool check = false;

  _MarketListModel(
      {this.id, this.product, this.check = false, this.description});
}
