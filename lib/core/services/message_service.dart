import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MessageType {
  info,
  success,
  error,
  warning,
}

Icon icon({
  required MessageType type,
}) {
  switch (type) {
    case MessageType.info:
      return const Icon(Icons.info, size: 28);
    case MessageType.success:
      return const Icon(Icons.check, size: 28);
    case MessageType.error:
      return const Icon(Icons.error, size: 28);
    case MessageType.warning:
      return const Icon(Icons.warning, size: 28);
    default:
      return const Icon(Icons.info, size: 28);
  }
}

Color bgColor(
  MessageType? type,
) {
  switch (type) {
    case MessageType.info:
      return Colors.blue;
    case MessageType.success:
      return Colors.green;
    case MessageType.error:
      return Colors.red;
    case MessageType.warning:
      return Colors.orange;
    default:
      return Colors.blue;
  }
}

void showMessage(
    {required BuildContext context,
    String title = "",
    String message = "",
    TextStyle? messageStyle,
    TextStyle? titleStyle,
    Color? backgroundColor,
    MessageType? type,
    SnackPosition? snackPosition}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    showCloseIcon: true,
    backgroundColor: bgColor(type),
    margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).width / 1.2),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  ));
}

void networkErrorMessage(BuildContext context) => showMessage(
    context: context,
    message: "در ارتباط با سرور مشکلی پیش آمد. دوباره تلاش کنید",
    type: MessageType.error);
