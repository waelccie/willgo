

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:willgo/app/data/models/order_DetailsModel.dart';
import '../../../../core/constants/const/app_constants.dart';
import '../../../widgets/progress_button.dart';

import '../../../routes/app_pages.dart';

class OrderCard extends StatelessWidget {
  final String title;
  final String orderId;
  final String date;
  final String totalAmount;
  final int quantity;
  final String status;
  final Color statusColor;
  final String? actionText;
  final Color? actionColor;

  const OrderCard({
    super.key,
    required this.title,
    required this.orderId,
    required this.date,
    required this.totalAmount,
    required this.quantity,
    required this.status,
    required this.statusColor,
    this.actionText,
    this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: const Color(0xffEDEDED))),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: statusColor, size: 10),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderId,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total amount",
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Text(
                        totalAmount,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Quantity",
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$quantity",
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (actionText != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: const Color(0xfffffeeeee)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
                      child: Text(
                        actionText!,
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: actionColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget payment_SummeryWidget1(OrderDetailsModel orderModel)=>  Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 2),
  child: Container(decoration: BoxDecoration(border:Border.all( color: const Color(0xffEDEDED)),borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Summary',style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16
          ),),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Items (${orderModel.data!.orderProducts.length})',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xff878787)
              ),),
              Text('${AppConstants.appCurrency} ${orderModel.data!.total}',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),)
            ],),
          SizedBox(height: 8.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xff878787)
              ),),
              Text("+${orderModel.data!.deliveryFee.toString()}",style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),)
            ],),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xff878787)
              ),),
              Text('-${AppConstants.appCurrency} ${orderModel.data!.discount}',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff01A0E2),
                  fontSize: 14
              ),)
            ],),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xff878787)
              ),),
              Text('${AppConstants.appCurrency} ${orderModel.data!.finalTotal}',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),)
            ],),

        ],),
    ),
  ),
);



Widget order_SummeryWidget1(OrderDetailsModel details)=>  Padding(
  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 2),
  child: Container(decoration: BoxDecoration(border:Border.all( color: const Color(0xffEDEDED)),borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order from',style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16
          ),),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(details.data!.restaurant!.arName.toString(),style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(0xff101010)
              ),),
              Text(details.data!.restaurant!.address.toString(),style: GoogleFonts.almarai(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                color: const Color(0xff878787)
              ),)
            ],),
          SizedBox(height: 8.h,),

          SizedBox(height: 8.h,),
          SizedBox(
            height: 8,
            child: ListView.separated(
                itemBuilder: (context,index){
              return     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(details.data!.orderProducts[index].product!.enName.toString(),style: GoogleFonts.almarai(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff878787)
                  ),),

                ],);

            }, separatorBuilder: (context,index){
              return SizedBox(height:1 ,);
            }, itemCount: details.data!.orderProducts.length),
          )




        ],),
    ),
  ),
);

Widget order_address(BuildContext context,OrderDetailsModel details)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0,),
  child: Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border:Border.all( color: const Color(0xffEDEDED)),borderRadius: BorderRadius.circular(16),)
    ,child:Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Deliver to ',style: GoogleFonts.roboto(fontWeight: FontWeight.w400,fontSize: 15.27,color: const Color(0xff101010))),
            TextSpan(text: details.data!.location?.address.toString(),style: GoogleFonts.inter(
      fontSize: 15.27,
              fontWeight: FontWeight.w600
            ))
          ]
        ),

      ),
        const SizedBox(height: 8,),
        Text( details.data!.location!.streetName.toString(),style: GoogleFonts.inter(
            fontSize: 14.27,
            fontWeight: FontWeight.w600
        ))
      ],
      ),
    ) ,),
);

Widget paymentdetails(BuildContext context,OrderDetailsModel details)=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0,),
  child: Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border:Border.all( color: const Color(0xffEDEDED)),borderRadius: BorderRadius.circular(16),)
    ,child:Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment method ',style: GoogleFonts.inter(
              fontSize: 15.27,
              fontWeight: FontWeight.w400
          )),

          const SizedBox(height: 8,),
          Text( details.data!.paymentMethod.toString(),style: GoogleFonts.inter(
              fontSize: 15.27,
              fontWeight: FontWeight.w600
          ))
        ],
      ),
    ) ,),
);

// Widget buttons(context)=>Row(
//   children: [
//     Expanded(
//       child: TextButton(onPressed: (){
//         showModalBottomSheet(
//             context:context,
//             shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//         top: Radius.circular(20),
//         ),
//         ),
//         clipBehavior: Clip.antiAliasWithSaveLayer, builder: (BuildContext context) { return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(26)
//           ),
//           height: MediaQuery.of(context).size.height*0.35,
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: cancelBottom_sheet(),
//           ),
//         ); },
//         );
//       }, child: Text('Cancel Order',style: GoogleFonts.roboto(
//           fontSize: 17,
//           fontWeight: FontWeight.w400,
//           color: const Color(0xff878787)
//       ),)),
//     ),
//     Expanded(
//       child: AppProgressButton(onPressed: (c){
//
//       },child: Text('Track Order',style: GoogleFonts.roboto(
//         fontWeight: FontWeight.w600,
//         fontSize: 17,
//         color: Colors.white
//       ),),),
//     ),
//
//   ],
// );

Widget cancelBottom_sheet(){
  return Column(
    children: [
      SizedBox(height: 5.h,),
      Container(
        height: 4.h,
        width: 58.w,
        decoration: BoxDecoration(color: const Color(0xffffcccccc),borderRadius: BorderRadius.circular(11)),
      ),
      SizedBox(height: 15.h,),
      Text("are you sure cancel order?",style: GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: FontWeight.w600
      ),),
      SizedBox(height: 15.h,),
      Text("Cancelled orders within minutes of the order will \nnot be charged any fees ",textAlign: TextAlign.center,style: GoogleFonts.dmSans(
          fontSize: 14,
          color: const Color(0xff878787),
          fontWeight: FontWeight.w400
      ),),
      const Spacer(),
      Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: const Color(0xffD6D6D6))
              ),
              child: AppProgressButton(onPressed: (c){

              },backgroundColor: Colors.white,child: Text('complete order',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.black
              ),),),
            ),
          ),
          SizedBox(width: 15.w,),
          Expanded(
            child: AppProgressButton(onPressed: (c){
              Get.toNamed(Routes.CANCEL_ORDER);

            },child: Text('cancel order',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.white
            ),),),
          ),

        ],
      ),
      SizedBox(height: 30.h,),

    ],
  );
}