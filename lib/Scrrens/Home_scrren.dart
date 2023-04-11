import 'package:flutter/material.dart';

import '../Model_class/Contact_model.dart';

List<contactModel> contactList=[
  contactModel(name: "Darshan Kumbhani",num: "9988776655"),
  contactModel(name: "Vivek",num: "5555555555"),
  contactModel(name: "Prinsh",num: "1111111111"),
  contactModel(name: "Kaushik",num: "2233445566"),
  contactModel(name: "Bhargava",num: "7777777777"),
  contactModel(name: "Dixt",num: "1122334455"),
  contactModel(name: "Krunal",num: "5566441122"),
  contactModel(name: "Yas",num: "5566998877"),
];

class Home_scrren extends StatefulWidget {
  const Home_scrren({Key? key}) : super(key: key);

  @override
  State<Home_scrren> createState() => _Home_scrrenState();
}

class _Home_scrrenState extends State<Home_scrren> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //top
            SingleChildScrollView(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.black))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_sharp,
                            size: 30,
                            color: Colors.black45,
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 30,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                      //text
                      SizedBox(
                        height: 75,
                      ),
                      Text(
                        "MY CONTACT",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                      //serch
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                offset: Offset(0, 3)),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search_rounded,
                                size: 30,
                              ),
                              hintText: "Type Name Or Number",
                            ),
                          ),
                        ),
                      ),
                      //first leter
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "A",
                        style: TextStyle(fontSize: 35, color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Contact
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return contact(contactList[index]);
              },itemCount: contactList.length,),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
        ),
      ),
    );
  }

  Widget contact(contactModel c1) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: Colors.black38))
      ),
      child: ExpansionTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue)
          ),
        ),
        title: Text("${c1.name}",style: TextStyle(fontSize: 20,color: Colors.blue),),
        subtitle: Text("${c1.num}",style: TextStyle(fontSize: 15),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.phone_sharp,size: 30,)),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.message_rounded,size: 30,)),
          ],
        ),
      ),
    );
  }
}
