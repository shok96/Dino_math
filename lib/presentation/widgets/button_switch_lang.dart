

import 'package:dino_solver/core/common/icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

enum ModeLang{
  Russian, English
}

class ButtonSwitchLang extends StatelessWidget{

  ModeLang modeLang;
  ButtonSwitchLang(this.modeLang);

  String get icon {
    switch (modeLang) {
      case ModeLang.Russian:
        return LocalIcons.flag_ru;
      case ModeLang.English:
        return LocalIcons.flag_us;
    }
  }

  void changeTranslate(BuildContext context){
    switch(modeLang){
      case ModeLang.Russian:
        context.locale = Locale("ru");
        break;
      case ModeLang.English:
        context.locale = Locale("en");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0).r,
      child: GestureDetector(
        onTap: (){
          changeTranslate(context);
        },
        child: SvgPicture.asset(
         icon,
          width: 100.w,
          height: 70.h,
        ),
      ),
    );
  }

}