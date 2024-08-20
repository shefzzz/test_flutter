import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'items_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.items});

  ItemsModel? items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(height:118, child: Image.asset('${items?.image}',fit: BoxFit.cover,)),

          Divider(color: Colors.black,thickness: 5,),

          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                CustomText(data: "${items?.name}"),
                Spacer(),
                CustomText(data: "${items?.color}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
