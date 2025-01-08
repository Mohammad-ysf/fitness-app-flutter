import 'package:fitness_app/common_widget/fitness_level_selector.dart';
import 'package:fitness_app/view/login/step3_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class Step2View extends StatefulWidget{
  const Step2View({super.key});

  @override
  State<Step2View> createState() => _Step2ViewState();
}

class _Step2ViewState extends State<Step2View> {
  var selectindex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColor.white,
          centerTitle: true,
          leading: IconButton(onPressed:(){
            Navigator.pop(context);
        }, icon: Image.asset("assets/img/back.png", width: 25, height: 25,)),
          title:  Text("مرحله 2 از 3", style: TextStyle(
            color: TColor.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        ),),
    
        body:
        SafeArea(
          child: Column(children: [
            

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("سطح آمادگی خود را انتخاب کنید",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            FitnessLevelSelector(
              title: "مقدماتی",
              subtitle: "شما یک تازه وارد هستید و تا به حال تمرین نداشته اید",
              isSelect: selectindex == 0,
              onPressed: (){
                setState(() {
                  selectindex = 0;
                });
              },
            ),

            FitnessLevelSelector(
              title: "متوسط",
              subtitle: "شما تقریبا تمرینات ورزشی را انجام میدادید",
              isSelect: selectindex == 1,
              onPressed: (){
                setState(() {
                  selectindex = 1;
                });
              },
            ),

            FitnessLevelSelector(
              title: "پیشرفته",
              subtitle: "شما یک ورزشکار حرفه ای هستید و به طور مرتب تمرین میکنید",
              isSelect: selectindex == 2,
              onPressed: (){
                setState(() {
                  selectindex = 2;
                });
              },
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: RoundButton(title: "بعدی", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Step3View()));
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
                      color: 2 == pObj ? TColor.primary : TColor.gray.withOpacity(0.7),
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