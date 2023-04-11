import 'dart:io';

import 'package:final_exam_flutter_2/Model_class/Contact_model.dart';
import 'package:final_exam_flutter_2/Scrrens/Home_scrren.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add_contact_scrren extends StatefulWidget {
  const Add_contact_scrren({Key? key}) : super(key: key);

  @override
  State<Add_contact_scrren> createState() => _Add_contact_scrrenState();
}

class _Add_contact_scrrenState extends State<Add_contact_scrren> {
  String? img;
  TextEditingController txtname=TextEditingController();
  TextEditingController txtnum=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 35,
                color: Colors.black,
              )),
          title: Text(
            "Add Contact",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          actions: [
            InkWell(
              onTap: () {
                contactModel c1 = contactModel(name: txtname.text,num: txtnum.text,img: img);
                contactList.add(c1);
                Navigator.pop(context);
              },
              child: Icon(
                Icons.done,
                size: 35,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image
                SizedBox(height: 100),
                Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  alignment: Alignment.center,
                  child: img == null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/image/p.png"),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File("${img}")),
                        ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          ImagePicker i1 = ImagePicker();
                          XFile? xfile =
                              await i1.pickImage(source: ImageSource.camera);
                          setState(() {
                            img = xfile!.path;
                          });
                        },
                        icon: Icon(
                          Icons.camera,
                          size: 30,
                          color: Colors.black,
                        )),
                    SizedBox(width: 40),
                    IconButton(
                        onPressed: () async {
                          ImagePicker i1 = ImagePicker();
                          XFile? xfile =
                              await i1.pickImage(source: ImageSource.gallery);
                          setState(() {
                            img = xfile!.path;
                          });
                        },
                        icon: Icon(
                          Icons.photo,
                          size: 30,
                          color: Colors.black,
                        )),
                  ],
                ),
                //name
                SizedBox(height: 20),
                TextFormField(
                  controller: txtname,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon: Icon(Icons.person,size: 30,color: Colors.blue,),
                    label: Text("Name",style: TextStyle(fontSize: 18,color: Colors.black),)
                  ),
                ),
                //number
                SizedBox(height: 20),
                TextFormField(
                  controller: txtnum,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.phone,size: 30,color: Colors.blue,),
                      label: Text("Phone",style: TextStyle(fontSize: 18,color: Colors.black),)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
