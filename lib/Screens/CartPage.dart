import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_cart_getx/Controller/ProductController.dart';


final ProductController productController = Get.put(ProductController());


class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text("Cart"),),
        actions: [
          IconButton(onPressed: (){
            productController.removeItems();
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              itemBuilder: (context,index){
                return Card(
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
                );
              })),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price"),
                Text(productController.price.value.toString())
              ],
            ),
          )
        ],
      ),
    );
  }
}
