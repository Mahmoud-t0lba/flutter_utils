import 'package:flutter/material.dart';
import 'package:futara/controller/constants/size.dart';
import 'package:futara/controller/routes/navigate_func.dart';
import 'package:futara/view/widgets/my_text.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image? image;

  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          margin: const EdgeInsets.only(top: 66),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText(title: title, fontSize: 24, fontWeight: FontWeight.w700),
              16.h,
              MyText(title: description, alien: TextAlign.center, fontSize: 16),
              24.h,
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () => pop(context),
                  child: MyText(title: buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 66,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(66)),
              child: image,
            ),
          ),
        ),
      ],
    );
  }
}
