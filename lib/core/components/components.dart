import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/core/constant/constant.dart';

// Widget defaultButton(
//         {required Function onTap, required String text, double size = 35.0}) =>
//     GestureDetector(
//       onTap: onTap(),
//       child: Text(
//         text,
//       ),
//     );

// Widget defaultTextFormFeild({
//   required TextEditingController controller,
//   required TextInputType textType,
//   Function()? onSubmit,
//   Function()? onChange,
//   required Function validate,
//   required String label,
//   required IconData prefix,
//   Widget? suffix,
//   Function? onTap,
//   bool isClickable = true,
// }) =>
//     TextFormField(
//       controller: controller,
//       keyboardType: textType,
//       onTap: () => onTap!(),
//       // onChanged: (s) => onChange!(),
//       // onFieldSubmitted: (s) => onSubmit!(),
//       validator: (s) => validate(s),
//       enabled: isClickable,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         prefixIcon: Icon(
//           prefix,
//           size: 30,
//         ),
//         suffixIcon: suffix,
//         labelText: label,
//         labelStyle: const TextStyle(fontSize: 20),
//       ),
//     );

Widget defaultTextButton(
    {required String text, required void Function()? onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text.toUpperCase(),
    ),
  );
}

Widget defaultButton({required Function() onPressed, required String text}) =>
    Container(
      width: 90.w,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constant.defaultColor,
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ),
    );
// Widget defaultButton(
//     {required Widget title,
//     required dynamic onTap,
//     Color? splashColor,
//     double? width,
//     double? height,
//     dynamic shape,
//     Color? color}) {
//   return MaterialButton(
//     onPressed: onTap,
//     splashColor: splashColor,
//     minWidth: width,
//     height: height,
//     shape: shape,
//     color: color,
//     elevation: 0,
//     child: title,
//   );
// }

// Default TextFormField
Widget defaultTextFormFeild({
  required TextEditingController controller,
  Text? label,
  // Function? onTap,
  TextInputType? keyboardType,
  int? maxLength,
  required Function validator,
  IconData? prefixIcon,
  IconData? suffixIcon,
  bool outlineInputBorderStatus = true,
  required TextInputType type,
  bool obscureText = false,
  String? hint,
  void Function(String)? onSubmit,
  void Function()? suffixTap,
  dynamic initialValue,
}) {
  return TextFormField(
    // onTap: () => onTap!(),
    onFieldSubmitted: onSubmit,

    controller: controller,
    initialValue: initialValue,
    maxLength: maxLength,
    keyboardType: keyboardType,
    validator: (s) => validator(s),
    obscureText: obscureText,
    decoration: InputDecoration(
      label: label,
      hintText: hint,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: InkWell(
        onTap: suffixTap,
        child: Icon(suffixIcon),
      ),
      border: outlineInputBorderStatus
          ? const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))
          : null,
    ),
  );
}

enum ToastEnum { success, error, warning }

void flutterToast({required String text, required ToastEnum state}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

Color toastColor(ToastEnum toastEnum) {
  Color color;
  switch (toastEnum) {
    case ToastEnum.success:
      color = Colors.green;
    case ToastEnum.warning:
      color = Colors.red;
    case ToastEnum.error:
      color = Colors.amber;
      break;
  }
  return color;
}

// Widget DefaultSmoothIndicator({
//   required PageController controller,
//   required int length,
//   Color activeColor = mainColor,
//   required double size,
//   required double radius,
//   double spacing = 10
// }){
//   return SmoothPageIndicator(
//     controller: controller,
//     count: length,
//     axisDirection: Axis.horizontal,
//     effect: SlideEffect(
//         spacing: 10,
//         radius: radius,
//         dotWidth: size,
//         dotHeight: size,
//         paintStyle:  PaintingStyle.stroke,
//         strokeWidth:  1.5,
//         dotColor:  Colors.grey,
//         activeDotColor: activeColor
//     ),
//   );
// }

void showSnackBar(
    {required String message,
    required BuildContext context,
    required Color color}) {
  var snackBar = SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    clipBehavior: Clip.hardEdge,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
    padding: const EdgeInsets.all(10),
    backgroundColor: color,
    duration: const Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
