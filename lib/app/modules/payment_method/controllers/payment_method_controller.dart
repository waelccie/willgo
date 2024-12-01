import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  // Counter for other purposes in the controller
  final count = 0.obs;

  // Controller for handling the card number text input
  final TextEditingController card_number = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    // Initialize the card number listener to format input automatically
    card_number.addListener(() {
      final text = card_number.text;
      // Automatically insert spaces as the user types
      final formattedText = _formatCardNumber(text);

      // Avoid unnecessary rebuilds by only updating when the text has changed
      if (formattedText != text) {
        card_number.value = card_number.value.copyWith(
          text: formattedText,
          selection: TextSelection.collapsed(offset: formattedText.length),
        );
      }
    });
  }

  // Helper function to format the card number with spaces every 4 digits
  String _formatCardNumber(String text) {
    text = text.replaceAll(' ', ''); // Remove existing spaces
    final newText = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) newText.write(' ');
      newText.write(text[i]);
    }

    return newText.toString();
  }

  @override
  void onClose() {
    // Clean up the controller to avoid memory leaks
    card_number.dispose();
    super.onClose();
  }

  // Example increment function
  void increment() => count.value++;
}
