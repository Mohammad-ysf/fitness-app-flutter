
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/select_datetime.dart';
import '../../common_widget/select_picker.dart';
import '../menu_view/menu_view.dart';

class Step3View extends StatefulWidget{
  const Step3View({super.key});

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  bool isAppleHealth = true;
  DateTime? selectDate;
  String? selectHeight;
  String? selectWeight;
  bool isMale = true;

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
          title:  Text("مرحله 3 از 3", style: TextStyle(
              color: TColor.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700),
          ),),

        body:
        SafeArea(
          child: Column(children: [


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "مشخصات فردی",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "برای گرفتن بهترین نتایج و تجربه بهتر اطلاعات فردی خود را وارد کنید",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                    ),
              ),
            ),
            SizedBox(height: media.width * 0.05,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "سلامت کامل",
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),

                        const SizedBox(height: 8,),

                      Text(
                        "شما هیچ گونه مانع و بیماری زمینه ای ندارید",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 16,
                        ),
                      ),
                    ],)
                      ,),
                    CupertinoSwitch(
                        activeColor: TColor.primary,
                        value: isAppleHealth,
                        onChanged: (newVal){
                          setState(() {
                            isAppleHealth = isAppleHealth;
                          });
                    } )
                  ],
                ),
                SizedBox(height: media.width * 0.05,),
                Divider(color: TColor.divider, height: 1,),
                SelectDatetime(
                  title: "تولد شما", didChange: (newDate){
                    setState(() {
                    selectDate = newDate;
                    });
                    },
                  selectDate: selectDate,
                ),
                Divider(color: TColor.divider, height: 1,),
                SelectPicker(
                  allVal:const [
                    "170 cm",
                    "171 cm",
                    "172 cm",
                    "173 cm",
                    "174 cm",
                    "175 cm",
                    "176 cm",
                    "177 cm",
                    "178 cm",
                    "179 cm",
                    "180 cm",
                    "181 cm",
                    "182 cm"
                  ],
                  selectVal: selectHeight,
                  title: "قد شما",
                  didChange: (newVal){
                    setState(() {
                      selectHeight = newVal;
                    });
                  },
                ),
                SelectPicker(
                  allVal:const [
                    "70 kg",
                    "71 Kg",
                    "72 kg",
                    "73 kg",
                    "74 kg",
                    "75 kg",
                    "76 kg",
                    "77 kg",
                    "78 kg",
                  ],
                  selectVal: selectWeight,
                  title: "وزن شما",
                  didChange: (newVal){
                    setState(() {
                      selectWeight = newVal;
                    });
                  },
                ),
                Divider(color: TColor.divider, height: 1,),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: media.width * 0.05,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "جنسیت",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CupertinoSegmentedControl(
                        groupValue: isMale,
                        selectedColor: TColor.primary,
                        unselectedColor: TColor.white,
                        borderColor: TColor.primary,
                        children: const {
                          true: Text(" مرد ",
                              style: TextStyle(fontSize: 18)),
                          false: Text(" زن ",
                              style: TextStyle(fontSize: 18))
                        },
                        onValueChanged: (isMaleVal) {
                          setState(() {
                            isMale = isMaleVal;
                          });
                        }, padding: EdgeInsets.zero, )
                    ],
                  ),
                ),
              ],
            ),
      ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: RoundButton(title: "شروع", onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (contex) => const MenuView()), (route) => false);
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
                      color: 3 == pObj ? TColor.primary : TColor.gray.withOpacity(0.7),
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