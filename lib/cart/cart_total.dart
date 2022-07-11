import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_controler.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();

  CartTotal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       Obx(
         () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$ ${controller.total}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                
           ),
       );
  }
}