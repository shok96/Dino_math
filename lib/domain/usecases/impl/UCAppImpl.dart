/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:40
 *
 */
import 'package:dino_solver/data/models/MUser.dart';
import 'package:dino_solver/domain/repository/userRepository.dart';
import 'package:dino_solver/domain/usecases/intf/UCApp.dart';
import 'package:package_info_plus/package_info_plus.dart';


class UCAppImpl extends UCApp {

  late PackageInfo packageInfo;

  //UCAppImpl();

  @override
  void initPackageInfo(PackageInfo packageInfo){
    this.packageInfo = packageInfo;
  }

  @override
  String getVersion() {
    return "ver: ${packageInfo.version}_${packageInfo.buildNumber}";
  }


}
