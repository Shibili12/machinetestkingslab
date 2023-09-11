import 'package:flutter/material.dart';
import 'package:machinetestkingslab/model/productmodel.dart';
import 'package:machinetestkingslab/pages/productpage.dart';

import 'package:machinetestkingslab/services/homeservive.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<ProductElement>? products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getproduct();
  }

  void getproduct() async {
    products = await Homeservice().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.builder(
              itemCount: products!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemBuilder: ((context, index) => Card(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${products![index].images}"))),
                        ),
                        Text(
                          products![index].title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(products![index].description),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("PRICE"),
                                Text("${products![index].price}"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("RATING"),
                                Text("${products![index].rating}"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("DISCOUNT"),
                                Text("${products![index].discountPercentage}"),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Productpage()));
                          },
                          child: Text("EDIT"),
                        ),
                      ],
                    ),
                  )))),
    );
  }
}
