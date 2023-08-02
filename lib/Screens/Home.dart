import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_cart_getx/Controller/ProductController.dart';
import 'package:shopping_cart_getx/Model/Products.dart';
import 'package:shopping_cart_getx/Screens/CartPage.dart';
import 'package:shopping_cart_getx/Screens/ProductDetails.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatelessWidget {
  
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Column(
          children: [
            Obx(() => Text(productController.itemcount.value.toString())),
            Icon(Icons.shopping_cart)
          ],
        ),
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage()));
          }),
      appBar: AppBar(title: Text("Products"),),
      body: ListView.builder(
        itemCount: productController.allproducts.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: ()=>ProductDetails(),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(productController.allproducts[index].image),
                    SizedBox(width: 3,),
                    Column(
                      children: [
                        Text(productController.allproducts[index].name),
                        Text(productController.allproducts[index].color),
                        Text(productController.allproducts[index].price)
                      ],
                    ),
                    ElevatedButton(onPressed: (){
                      productController.increase(index);
                    }, child: Icon(Icons.remove)),
                    Obx(() => Text(productController.allproducts[index].count.toString())),
                    ElevatedButton(onPressed: (){
                      productController.decrease(index);
                    }, child: Icon(Icons.add)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
