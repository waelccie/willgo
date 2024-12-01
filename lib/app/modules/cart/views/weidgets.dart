import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/modules/cart/controllers/cart_controller.dart';

import '../../../../core/global/const.dart';
import '../../../widgets/network_image.dart';

class cartItem extends StatelessWidget {
  final image ,name,cat,price,id;
 int quentity;
final  CartController controller;
   cartItem({super.key,required this.name,required this.image,required this.cat,required this.price, required this.quentity,required this.controller,required this.id});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              print(id);
              print(quentity);
             controller.updte_Cart(quentity.toString(), id);
            },
            backgroundColor: Colors.green.shade100,
            foregroundColor: Colors.green,
            icon: Icons.edit,
            label: 'edit',
          ),
          SlidableAction(
            onPressed: (context) {
              controller.deleteItem_Cart(id);
            },
            backgroundColor: Colors.red.shade100,
            foregroundColor: Colors.red,
            icon: Icons.delete_outline,
            label: 'delete',
          ),
        ],
      ),
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
        child: Container(

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),              color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                AppCashedImage(
                  imageUrl: image,
                  width: 71.w,
                  height: 64.h,
                  fit: BoxFit.cover,
                  radius: 20,

                ),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,

                    ),),
                    SizedBox(height: 3.h,),

                    Text(cat,style: GoogleFonts.dmSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,

                    ),),
                    SizedBox(height: 3.h,),
                    Text('\$$price',style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: const Color(0xff01A0E2),
                      fontWeight: FontWeight.w500,

                    ),),
                  ],),
                const Spacer(),
                Row(children: [
                  InkWell(
                    onTap: (){
                      quentity++;
                      controller.update();


                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff01A0E2)
                      ),height: 75,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 14.0),
                        child: Center(child: Icon(Icons.minimize_sharp,color: Colors.white,)),
                      ),),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Text("$quentity",style: GoogleFonts.dmSans(fontWeight: FontWeight.w500,fontSize: 16),),
                  ),
                  InkWell(
                    onTap: (){

                      quentity++;
                      controller.update();
                    },
                    child: Container(decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff01A0E2))
                    ),child: const Icon(Icons.add,color: Color(0xff01A0E2),),),
                  ),

                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}