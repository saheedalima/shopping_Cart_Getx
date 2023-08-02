import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("image"),
            Text("data"),
            SizedBox(height: 8,),
            ListView(
              children: [
                Text(";,qpicnfwouvnemfvipfemvpiwk;mvipwvmiiprrfkpekkmkklmf;nlkmklwfmwklmw'lgkwepgker'pl3[p'lr"),

              ],
            )
          ],
        ),
      ),
    );
  }
}
