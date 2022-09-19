import 'dart:ffi';

import 'package:amazon_clonee/model/user_details.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel? userDetails;
  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Loading", address: "Loading");

     
}
