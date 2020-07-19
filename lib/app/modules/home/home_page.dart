import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:market_list/app/modules/home/components/item/item_widget.dart';
import 'package:market_list/app/modules/home/home_module.dart';
import 'package:market_list/app/shared/services/models/market_list_model.dart';
import 'home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Market List"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final HomeController controller = HomeModule.to.get();
  final _text = TextEditingController();
  final _text2 = TextEditingController();
  _showDialog([MarketListModel model]) {
    model = model ?? MarketListModel();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Color(0xFFd4b5b0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              'Add Product',
              style: TextStyle(color: Color(0xFF383e56)),
            ),
            content: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text('Product Name'),
                  TextField(
                    onChanged: (value) {
                      model.product = value;
                    },
                    controller: _text,
                    decoration: InputDecoration(
                        hintText: 'Orange Juice',
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrange[800]))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Product Description'),
                  TextField(
                    onChanged: (value) {
                      model.description = value;
                    },
                    controller: _text2,
                    decoration: InputDecoration(
                        hintText: '1L',
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepOrange[800]))),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF383e56)),
                  )),
              FlatButton(
                  onPressed: () {
                    if (_text.text.isNotEmpty && _text2.text.isNotEmpty)
                      controller.add(model);

                    _text2.clear();
                    _text.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Color(0xFF383e56)),
                  ))
            ],
          );
        });
  }
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeedad1),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xFFf69e7b)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF383e56),
      ),
      body: Observer(
        builder: (_) {
          return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.list.length,
                itemBuilder: (_, index) {
                  MarketListModel model = controller.list[index];
                  return ItemWidget(model: model);
                },
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff383e56),
          child: Icon(
            Icons.add,
            color: Color(0xFFf69e7b),
          ),
          onPressed: () {
            //   controller.add(MarketListModel(
            //    product: 'Added',
            //     description: 'added',
            //    check: false,
            //  )
            //  );
            _showDialog();
          }),
    );
  }
}
