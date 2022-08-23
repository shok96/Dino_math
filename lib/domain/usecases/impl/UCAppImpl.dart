/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:40
 *
 */
import 'dart:io';

import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCApp.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:package_info_plus/package_info_plus.dart';


class UCAppImpl extends UCApp {

  late PackageInfo packageInfo;

  GooglePlayServicesAvailability? availability;

  //UCAppImpl();

  @override
  void initPackageInfo(PackageInfo packageInfo){
    this.packageInfo = packageInfo;
  }

  @override
  String getVersion() {
    return "ver: ${packageInfo.version}_${packageInfo.buildNumber}";
  }

  @override
  void checkGoogleService(GooglePlayServicesAvailability availability) {
    this.availability = availability;
  }

  @override
  bool getGoogleServide() {
    if (Platform.isAndroid) {
      if (availability != null)
        return availability == GooglePlayServicesAvailability.success ||
            availability == GooglePlayServicesAvailability.serviceUpdating;
      else
        return false;
    }
    else return true;
  }


}
