import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping_cart_getx/Model/Products.dart';
import 'package:shopping_cart_getx/Screens/CartPage.dart';

class ProductController extends GetxController {

  RxList<Product> allproducts = productList.obs;
  bool isItemListScreen = true;
  bool isCartScreen = false;
  Rx<int> itemcount =0.obs;
  Rx<double> price = 0.0.obs;


  Widget navigatetocartscreen (BuildContext context) {
    isCartScreen =true;
    isItemListScreen = false;
    calculateprice();
    return CartPage();
  }
  calculateAll(){
    itemcount.value =0;
    //taking all values one by one from productlist to element
    for(var element in productList){
      itemcount.value = element.count++;
    }
  }
  void calculateprice() {
    price.value = 0;
    for(var element in productList){
      if(element.count> 0){
        price.value = (double.parse(element.price.replaceAll("\$", "")*element.count)+price.value);
      }
    }
  }
  Future<bool> navigatlistitemscreen (BuildContext context) async{
    productController.isItemListScreen = true;
    productController.isCartScreen = false;
    return true;
  }
   void increase(int index){
    allproducts[index].count++;
    allproducts.refresh();
    calculateAll();
    calculateprice();
   }
   void decrease(int index){
    if(allproducts[index].count > 0){
      allproducts[index].count--;
      calculateAll();
      calculateprice();
    }
   }
   void removeItems(){
    for(var item in allproducts){
      item.count = 0;
      allproducts.refresh();
      itemcount.value = 0;
      calculateprice();
    }
   }
   VoidCallback? isCheckoutButton () {
    if(itemcount > 0)return (){};
    return null;
}

}