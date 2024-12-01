import 'package:flutter/material.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTrackingPage extends StatelessWidget {
  final List<StepperData> steps = [
    StepperData(
      title: StepperText(
        "Preparing",
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: StepperText(
        "28/09/2021",
        textStyle: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
      ),
    ),
    StepperData(
      title: StepperText(
        "Order Received",
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: StepperText(
        "28/09/2021",
        textStyle: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
      ),
    ),
    StepperData(
      title: StepperText(
        "On The Way",
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: StepperText(
        "28/09/2021",
        textStyle: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
      ),
    ),
    StepperData(
      title: StepperText(
        "Delivered",
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: StepperText(
        "28/09/2021",
        textStyle: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
      ),
    ),
  ];

  final List<IconData> icons = [
    Icons.check_circle,
    Icons.inventory_2,
    Icons.delivery_dining,
    Icons.home,
  ];

  OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
