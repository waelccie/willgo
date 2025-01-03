import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/cart/controllers/cart_controller.dart';
import 'package:willgo/core/extensions/build_context.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';

class cartItem extends StatefulWidget {
  final image, name, cat, price, id;
  final int initialQuantity;
  final CartController controller;

  const cartItem({
    super.key,
    required this.name,
    required this.image,
    required this.cat,
    required this.price,
    required this.initialQuantity,
    required this.controller,
    required this.id
  });
  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }
  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              print(widget.id);
              print(quantity);
              widget.controller.updte_Cart(quantity.toString(), widget.id);
            },
            backgroundColor: Colors.green.shade100,
            foregroundColor: Colors.green,
            icon: Icons.edit,
            label: context.translate.edit,
          ),
          SlidableAction(
            onPressed: (context) {
              widget.controller.deleteItem_Cart(widget.id);
            },
            backgroundColor: Colors.red.shade100,
            foregroundColor: Colors.red,
            icon: Icons.delete_outline,
            label: context.translate.delete,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 10.h),
        child: Container(
          width: double.infinity, // Ensure the container takes the full width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
          ),
          child: Padding(
            padding:  EdgeInsets.all(12.0.w),
            child: Row(
              children: [
                AppCashedImage(
                  imageUrl: widget.image,
                  width: 71.w,
                  height: 64.h,
                  fit: BoxFit.cover,
                  radius: 20.r,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      widget.cat,
                      style: GoogleFonts.dmSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      '\$${widget.price}',
                      style: GoogleFonts.dmSans(
                        fontSize: 16.sp,
                        color: const Color(0xff01A0E2),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff01A0E2),
                        ),
                        height: 25.h,
                        width: 25.w,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Text(
                        "$quantity",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xff01A0E2)),
                        ),
                        height: 25.h,
                        width: 25.w,
                        child: const Icon(
                          Icons.add,
                          color: Color(0xff01A0E2),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}




