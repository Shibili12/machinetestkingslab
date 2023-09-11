import 'package:flutter/material.dart';
import 'package:machinetestkingslab/model/productonemodel.dart';
import 'package:machinetestkingslab/services/updateservice.dart';

class Productpage extends StatefulWidget {
  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  List<Productone>? productone;
  int index = 0;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  var isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getolddetails();
  }

  void getolddetails() async {
    productone = await Updateservice().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextFormField(
            controller: titlecontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: productone![index].title),
          ),
          TextFormField(
            controller: pricecontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "${productone![index].price}"),
          ),
          TextFormField(
            maxLines: 5,
            controller: descriptioncontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: productone![index].description,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              updateproduct(
                id: "${productone![index].id}",
                title: titlecontroller.text,
                price: pricecontroller.text,
                decription: descriptioncontroller.text,
              );
            },
            child: Text("done"),
          ),
        ],
      )),
    );
  }

  Future<void> updateproduct(
      {required String id,
      required String title,
      required String price,
      required String decription}) async {
    setState(() {
      isLoading = true;
    });
  }
}
