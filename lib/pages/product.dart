import 'package:flutter/material.dart';
import 'package:flutter_firebase/service/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController typecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Product",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Form",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Price",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: pricecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Type",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: typecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    String Id = randomAlphaNumeric(10);
                    Map<String, dynamic> productInfoMap = {
                      "Name": namecontroller.text,
                      "Price": pricecontroller.text,
                      "Id": Id,
                      "Type": typecontroller.text,
                    };
                    await DatabaseMethods()
                        .addProductDetails(productInfoMap, Id)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg:
                              "Thông tin sản phẩm đã được cập nhật thành công !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  },
                  child: Text(
                    "Add",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
