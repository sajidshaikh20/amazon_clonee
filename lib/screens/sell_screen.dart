import 'package:amazon_clonee/providers/user_details_provider.dart';
import 'package:amazon_clonee/resources/cloudfirestore.dart';
import 'package:amazon_clonee/utils/colors_themes.dart';
import 'package:amazon_clonee/utils/utils.dart';
import 'package:amazon_clonee/widget/custom_main_botton.dart';
import 'package:amazon_clonee/widget/loading_widget.dart';
import 'package:amazon_clonee/widget/text_field.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  // Expanded spaceThingy = Expanded(child: Container());

  List<int> keysForDiscount = [0, 70, 60, 50];

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: !isLoading
            ? SingleChildScrollView(
                child: SizedBox(
                  height: screensize.height,
                  width: screensize.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              image == null
                                  ? Image.network(
                                      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/271deea8-e28c-41a3-aaf5-2913f5f48be6/de7834s-6515bd40-8b2c-4dc6-a843-5ac1a95a8b55.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI3MWRlZWE4LWUyOGMtNDFhMy1hYWY1LTI5MTNmNWY0OGJlNlwvZGU3ODM0cy02NTE1YmQ0MC04YjJjLTRkYzYtYTg0My01YWMxYTk1YThiNTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.BopkDn1ptIwbmcKHdAOlYHyAOOACXW0Zfgbs0-6BY-E",
                                      height: screensize.height / 10,
                                    )
                                  : Image.memory(
                                      image!,
                                      height: screensize.height / 10,
                                    ),
                              IconButton(
                                  onPressed: () async {
                                    Uint8List? temp = await Utils().pickImage();
                                    if (temp != null) {
                                      setState(() {
                                        image = temp;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.file_upload))
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            height: screensize.height * 0.7,
                            width: screensize.width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // const Text(
                                //   "Item details",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 23),
                                // ),
                                TextFieldWidget(
                                    title: "Item Name",
                                    controller: nameController,
                                    obscureText: false,
                                    hintText: "Enter the name of item"),
                                TextFieldWidget(
                                    title: "Cost",
                                    controller: costController,
                                    obscureText: false,
                                    hintText: "Enter the cost of item"),
                                const Text(
                                  "Discount",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                ListTile(
                                  title: const Text("None"),
                                  leading: Radio(
                                      value: 1,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: const Text("70%"),
                                  leading: Radio(
                                      value: 2,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: const Text("60%"),
                                  leading: Radio(
                                      value: 3,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: const Text("50%"),
                                  leading: Radio(
                                      value: 4,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          CustomMainBotton(
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                String output = await CloudFirestoreClass()
                                    .uploadProductToDatabase(
                                        image: image,
                                        productName: nameController.text,
                                        rawCost: costController.text,
                                        discount: keysForDiscount[selected - 1],
                                        sellerName:
                                            Provider.of<UserDetailsProvider>(
                                                    context,
                                                    listen: false)
                                                .userDetails
                                                .name,
                                        sellerUid: FirebaseAuth
                                            .instance.currentUser!.uid);

                                if (output == "success") {
                                  Utils().showSnackBar(
                                      context: context,
                                      content: "Posted Product");
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              },
                              child: const Text(
                                "Sell",
                                style: TextStyle(color: Colors.black),
                              )),
                          CustomMainBotton(
                              color: Colors.grey[300]!,
                              isLoading: false,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }
}
