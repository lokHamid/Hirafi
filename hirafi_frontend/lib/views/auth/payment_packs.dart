import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/widgets/buttons/hirafi_blue_button.dart';

import '../../models/constants.dart';
import 'login.dart';

class PaymentPacks extends ConsumerWidget{
  const PaymentPacks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HirafiConstants().hirafi_blue,
              HirafiConstants().hirafi_darker_blue
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// all widget children of this UI will be here :
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("اختر خطة الدفع",style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("الأكثر شعبية"),
                                    ),
                                  ),
                                  Text("الخطة الشهرية",style: TextStyle(fontSize: 30),),
                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text("2900دج",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.check,color: Colors.black,),
                                        Text(style: TextStyle(fontSize: 20),"dsadas")
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}