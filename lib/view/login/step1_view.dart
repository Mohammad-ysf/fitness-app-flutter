import 'package:fitness_app/view/login/step2_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class Step1View extends StatefulWidget{
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true, title:  Text("مرحله 1 از 3", style: TextStyle(
          color: TColor.primary,
          fontSize: 20,
          fontWeight: FontWeight.w700),
      ),),

      body:
        SafeArea(
          child: Column(children: [

            const Spacer(),
            Image.asset("assets/img/step_1.png",
              width: media.width * 0.6,
              height: media.width * 0.6,
              fit: BoxFit.contain,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text("خوش آمدید به\nاپلیکیشن تناسب اندام",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              ),
            ),
            Text("تمرینات شخصی به شما کمک می کند\nقدرت داشته باشید و سبک زندگی سالمی داشته باشید.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w300),
            ),
            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: RoundButton(title: "شروع کنید", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Step2View()));

              },),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1,2,3].map((pObj) {

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: 1 == pObj ? TColor.primary : TColor.gray.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6)
                  ),
                );

              }).toList(),
            ),

            const SizedBox(height: 15,)

          ],),
        )
    );
  }
}