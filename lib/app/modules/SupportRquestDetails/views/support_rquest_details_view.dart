// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/support_rquest_details_controller.dart';

// class SupportRquestDetailsView extends GetView<SupportRquestDetailsController> {
//   const SupportRquestDetailsView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rquest Details'),
//         centerTitle: true,
//       ),
//       body: const Center(
//         child: Text(
//           'SupportRquestDetailsView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:willgo/app/modules/SupportRquestDetails/widgets/bubble.dart';
import 'package:willgo/core/constants/theme/colors_manager.dart';

import '../controllers/support_rquest_details_controller.dart';

class SupportRquestDetailsView extends GetView<SupportRquestDetailsController> {
   SupportRquestDetailsView({super.key});
  


final Map<String, dynamic> args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(30),
              children:  [
                    Align(
                  alignment: Alignment.centerRight,
                  child: Bubble(
                    message: args["note"],
                    isSender: true,
                  ),
                ),
                 args["answer"] == null?
                Align(
                  alignment: Alignment.centerLeft,
                  child: Bubble(
                    message: args["answer"],
                    isSender: false,
                  ),
                ): Container(),
            
          
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}
