// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_list_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketListModel on _MarketListModel, Store {
  final _$productAtom = Atom(name: '_MarketListModel.product');

  @override
  String get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(String value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_MarketListModel.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$checkAtom = Atom(name: '_MarketListModel.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  @override
  String toString() {
    return '''
product: ${product},
description: ${description},
check: ${check}
    ''';
  }
}
