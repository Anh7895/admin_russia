import 'package:flutter/material.dart';
import '../model/product_item.dart';


import 'detail_screen.dart';
final List<ProductItem> productItems = <ProductItem>[
  ProductItem(unit: 3,eric: "truong", no: 'anh', star: '3', time: "10:00", ) ,
  ProductItem(unit: 2,eric: "truong", no: 'tuan', star: '4', time: "1:00",) ,
  ProductItem(unit: 4,eric: "truong", no: 'quang', star: '5', time: "12:00", ) ,
  ProductItem(unit: 6,eric: "truong", no: 'nam', star: '7', time: "11:00", ) ,
];

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final List<ProductItem> _items = productItems;
  List<ProductItem> get items => _items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {
            final result = await Navigator.pushNamed(context, DetailScreen.routeName);
            debugPrint('$result');
            setState(() {
              if(result!= null){
                productItems.add(result as ProductItem);
              }
            });
          }, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(itemBuilder: (BuildContext context, int index){
        final ProductItem item = productItems[index];
        return ListTile(
          title: Text( '${index+1}' +"    "+ "No: " + item.no +" - "+ "Star: " + item.star +" - "+ "Eric: "+ item.eric +" - "+"Time: " + item.time +" - "+ 'Unit:'+ "${item.unit.toInt()}"  ,style: TextStyle(color: Colors.white),),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {
                 Navigator.pushNamed(context, DetailScreen.routeName, arguments: item);

              },  icon: const Icon(
                Icons.edit,
                color: Colors.purple,
              ),
              ),
              IconButton(onPressed: () {
                setState(() {
                  productItems.remove(item);
                });
              }, icon: Icon(Icons.delete, color: Colors.red,))
            ],
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.white,), itemCount: productItems.length),

    );
  }
}
