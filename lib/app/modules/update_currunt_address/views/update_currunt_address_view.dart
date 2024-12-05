import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/getLocation.dart';
import 'package:willgo/app/widgets/custom_future_builder.dart';
import '../../../../gen/assets.gen.dart';
import '../../../widgets/progress_button.dart';

import '../../../routes/app_pages.dart';
import '../controllers/update_currunt_address_controller.dart';

class UpdateCurruntAddressView extends GetView<UpdateCurruntAddressController> {
  const UpdateCurruntAddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateCurruntAddressController>(
      builder: (UpdateCurruntAddressController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Update Current Address'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.offAllNamed(Routes.CART);
                },
                icon: Assets.icons.cart.svg(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFutureBuilder(
                    future: controller.getLocations,
                    onData: (BuildContext context, GetLocation data) {
                      final locatuin = data.data;
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xffD6D6D6)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        locatuin[index].buildingName.toString(),
                                        style: GoogleFonts.dmSans(
                                          color: const Color(0xff101010),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        locatuin[index].address.toString(),
                                        style: GoogleFonts.dmSans(
                                          color: const Color(0xff101010),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Radio<int>(
                                    fillColor:
                                        WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.selected)) {
                                          return const Color(0xff01A0E2);
                                        }
                                        return Colors.grey;
                                      },
                                    ),
                                    value: locatuin[index].id!.toInt(),
                                    groupValue: controller.selectedId,
                                    onChanged: (int? value) {
                                      controller.selectedId = value;
                                      controller.update();
                                      controller.setDefaultLocation(
                                          controller.selectedId);
                                      print("Selected ID: $value");
                                    },
                                    activeColor: Colors.blue,
                                    focusColor: const Color(0xff01A0E2),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 8);
                        },
                        itemCount: locatuin.length,
                      );
                    }),
                SizedBox(
                  height: 10.h,
                ),
                AppProgressButton(
                  onPressed: (c) {
                    Get.toNamed(Routes.NEW_LOCATION);
                  },
                  backgroundColor: const Color(0xffF0F5FF),
                  radius: 8,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        color: Color(0xff01A0E2),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Add New Location",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: const Color(0xff01A0E2)),
                      )
                    ],
                  ),
                )
              ],
            ).paddingSymmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
          ),
        );
      },
    );
  }
}
