import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class addScreen extends StatelessWidget {
  TextEditingController categoryTEC = TextEditingController();
  TextEditingController brandTEC = TextEditingController();
  TextEditingController imageUrlTEC = TextEditingController();
  TextEditingController nameTEC = TextEditingController();
  TextEditingController styleTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();
  TextEditingController stocksTEC = TextEditingController();
  TextEditingController priceTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('items');

    Future<void> addItems() {
      var category = categoryTEC.text;
      var brand = brandTEC.text;
      var imageUrl = imageUrlTEC.text;
      var name = nameTEC.text;
      var style = styleTEC.text;
      var description = descriptionTEC.text;
      var stocks = stocksTEC.text;
      var price = priceTEC.text;
      return users
          .add({
            'Category': category.toString(),
            'brand': brand.toString(),
            'image_url': imageUrl.toString(),
            'name': name.toString(),
            'style': style.toString(),
            'description': description.toString(),
            'stocks': int.parse(stocks.toString()),
            'price': int.parse(price.toString())
          })
          .then((value) => print("Collection Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Kicks Club',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Add Sneaker Product',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 79),
                    child: Text(
                      'Category',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: categoryTEC,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Category",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 105),
                    child: Text(
                      'Brand',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 11),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: brandTEC,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Brand",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 70),
                    child: Text(
                      'Image Url',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 22),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: imageUrlTEC,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Image Url",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 100),
                    child: Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: nameTEC,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 113),
                    child: Text(
                      'Style',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: styleTEC,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Style",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 55),
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: descriptionTEC,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Description",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Stocks Remaining',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 35),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: stocksTEC,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Stocks",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 115),
                    child: Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                  SizedBox(width: 7),
                  Container(
                    width: MediaQuery.of(context).size.width * .40,
                    height: 40,
                    child: TextFormField(
                      controller: priceTEC,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Price",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    addItems();
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 10)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      overlayColor: MaterialStateProperty.all(Colors.grey[300]),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 17, color: Colors.white))),
                  child: Text("Save Collection")),
            ],
          ),
        ),
      ),
    );
  }
}
