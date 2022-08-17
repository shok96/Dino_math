import 'package:dino_solver/core/common/icons.dart';
import 'package:dino_solver/core/common/images.dart';
import 'package:flutter/widgets.dart';

class BackButton extends StatelessWidget{

  BuildContext context;
  VoidCallback? action;

  BackButton(this.context, {this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(action != null) action!();
        Navigator.of(context).pop();
      },
      child: Image.asset(LocalImages.back),
    );
  }

}