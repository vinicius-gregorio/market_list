import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:market_list/app/shared/services/models/market_list_model.dart';
import 'package:market_list/app/modules/home/home_module.dart';
import '../../home_controller.dart';

class ItemWidget extends StatelessWidget {
  final MarketListModel model;

  const ItemWidget({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeModule.to.get();
    return Observer(builder: (_) {
      return ListTile(
        onLongPress: () => showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                backgroundColor: Color(0xFFd4b5b0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Text(
                  'Delete product?',
                  style: TextStyle(color: Color(0xFF383e56)),
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        controller.delete(model);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Color(0xFF383e56)),
                      ))
                ],
              );
            }),
        onTap: () {
          model.check = !model.check;
        },
        title: Text(model.product),
        subtitle: Text(model.description),
        trailing: Checkbox(
            checkColor: Color(0xFFf69e7b),
            activeColor: Color(0xFFf69e7b),
            value: model.check,
            onChanged: (bool value) {
              model.check = value;
            }),
      );
    });
  }
}
