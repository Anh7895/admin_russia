
import 'package:admin_russia/model/product_item.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail_screen';
  final ProductItem? item;
  const DetailScreen({Key? key, this.item}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _formKey = GlobalKey<FormState>();
  var _editProduct = ProductItem(no: "", eric: "", unit: 0, star: "", time: "");
  var _isInit = true;
  final Map<String,dynamic> _initValue ={
    'no':'',
    'id':'-1',
    'eric': '',
    'unit' : '',
    'star' : '',
    'time' : '',
  };
  void initValues(ProductItem? item){
    _initValue['no'] = item?.no;
    _initValue['eric'] = item?.eric;
    _initValue['unit'] = item?.unit.toString();
    _initValue['star'] = item?.star;
    _initValue['time'] = item?.time;
  }
  @override
  void initState() {
    if(widget.item!= null){
      initValues(widget.item);
    }
    super.initState();
  }
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as ProductItem?;
    if (args != null) {
      initValues(args);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(" Edit "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children:  [
                TextFormField(
                  initialValue: _initValue["no"],
                  style: TextStyle(color: Colors.white),
                  validator: (String? value){
                    if (value?.isEmpty == true) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _initValue["no"] = value ?? '';
                  },

                  decoration: InputDecoration(
                    labelText: "No",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                ),
                const SizedBox(height: 10,),
                TextFormField(
                  initialValue: _initValue["eric"],
                  style: TextStyle(color: Colors.white),
                  validator: (String? value){
                    if (value?.isEmpty == true) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _initValue["eric"] = value ?? '';
                  },

                  decoration: InputDecoration(
                    labelText: "Eric",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                ),
                const SizedBox(height: 10,),
                TextFormField(
                  initialValue: _initValue["unit"],
                  style: TextStyle(color: Colors.white),
                  validator: (String? value){
                    if (value?.isEmpty == true) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _initValue["unit"] = value ?? '';
                  },

                  decoration: InputDecoration(
                    labelText: "Unit",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                ),
                const SizedBox(height: 10,),
                TextFormField(
                  initialValue: _initValue["star"],
                  style: TextStyle(color: Colors.white),
                  validator: (String? value){
                    if (value?.isEmpty == true) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _initValue["star"] = value ?? '';
                  },

                  decoration: InputDecoration(
                    labelText: "Star",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                ),
                const SizedBox(height: 10,),
                TextFormField(
                  initialValue: _initValue["time"],
                  style: TextStyle(color: Colors.white),
                  validator: (String? value){
                    if (value?.isEmpty == true) {
                      return 'Title is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _initValue["time"] = value ?? '';
                  },

                  decoration: InputDecoration(
                    labelText: "Time",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(200, 40),
                  ),
                  onPressed: () {
                    _saveForm();
                }, child: const Text('Add', style: TextStyle(color: Colors.white),),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveForm(){
    if (_formKey.currentState?.validate() == true){
      _formKey.currentState?.save();
      Navigator.pop(context, ProductItem(
          no: _initValue['no'].toString(),
          eric: _initValue['eric'],
          unit: double.parse(_initValue['unit']),
          star: _initValue['star'],
          time: _initValue['time'],
          ));
    }
  }
}
