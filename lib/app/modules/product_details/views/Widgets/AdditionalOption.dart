import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app.dart';
import 'package:willgo/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:willgo/app/modules/restaurant_details/Weidget/compolist.dart';
import '../../../../data/models/cart.dart';
import '../../../../data/models/cart.dart';
import '../../../../data/models/product_details.dart'as x;

class AdditionalOptionsWidget extends StatefulWidget {
  final List<x.Options> options;
   List<x.Options> options1=[];

   AdditionalOptionsWidget({super.key, required this.options});

  @override
  State<AdditionalOptionsWidget> createState() => _AdditionalOptionsWidgetState();
}

class _AdditionalOptionsWidgetState extends State<AdditionalOptionsWidget> {

  Map<String, bool> selectedOptions = {};
  Map<String, String?> selectedSubOptions = {};

  @override
  void initState() {
    super.initState();
    // Initialize the selectedOptions map with default values
    for (final option in widget.options) {
      selectedOptions[option.title.toString()] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Additional Options:',
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101010)
              ),
            ),
          ),
          ...widget.options.map((option) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      option.title.toString(),
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff101010),
                          fontSize: 15.27.sp
                      ),
                    ),
                  ),
                  Text(
                    '+ ${option.price}',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff101010),
                        fontSize: 15.27.sp
                    ),
                  ),
                  Checkbox(
                    side: const BorderSide(width: 0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    value: selectedOptions[option.title.toString()] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedOptions[option.title.toString()] = value ?? false;

                        if (!value!) {
                          selectedSubOptions[option.title.toString()] = null;
                        }
                        if (value == true) {
                          controller.addOption(option);
                          // if (!widget.options1.contains(option)) {
                          //   widget.options1.add(option);
                          //   print(widget.options1);
                          //   Get.find<ProductDetailsController>().options1.add(widget.options1);
                          // }
                        } else {
                          widget.options1.add(option);
                        }
                      });
                    },
                    activeColor: const Color(0xff01A0E2),
                  ),
                ],
              ),
            ],
          )).toList(),
        ],
      );
      },

    );
  }
}