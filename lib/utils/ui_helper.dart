import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIHelper {
  static Future showSnackbar(BuildContext context, String message, Color color) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: color,
        fontSize: 16.0
   
    );
  }

  static Widget loadingSpinner() {
    return const Center(child: CircularProgressIndicator());
  }

  static Widget errorView(
      {required String message, required VoidCallback onRetry}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
