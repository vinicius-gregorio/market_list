// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listAtom = Atom(name: '_HomeControllerBase.list');

  @override
  ObservableList<MarketListModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<MarketListModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$addAsyncAction = AsyncAction('_HomeControllerBase.add');

  @override
  Future add(MarketListModel model) {
    return _$addAsyncAction.run(() => super.add(model));
  }

  final _$deleteAsyncAction = AsyncAction('_HomeControllerBase.delete');

  @override
  Future delete(MarketListModel model) {
    return _$deleteAsyncAction.run(() => super.delete(model));
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
