
import 'package:fitness_app/view/tips/tips_details_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/tip_row.dart';

class TipsView extends StatefulWidget {
  const TipsView({super.key});

  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  List tipsArr = [
    {"name": "درباره تمرینات"},
    {"name": "چطور وزن خود را کم کنیم؟"},
    {"name": "معرفی برنامه غذایی"},
    {"name": "آب و غذا"},
    {"name": "نوشیدن آب"},
    {"name": "چه مقدار وعده غذایی باید خورد"},
    {"name": "قوی تر شدن"},
    {"name": "مزایای پوشیدن کفش در تمرین"},
    {"name": "راهنمایی های سلامت بدن"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        centerTitle: true,
        elevation: 0.1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/black_white.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "راهنمایی",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            var tObj = tipsArr[index] as Map? ?? {};
            return TipRow(
              tObj: tObj ,
              isActive: index == 0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TipsDetailView(tObj: tObj,) ));
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: tipsArr.length),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_running.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_meal_plan.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_home.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset("assets/img/menu_weight.png",
                    width: 25, height: 25),
              ),
              InkWell(
                onTap: () {},
                child:
                Image.asset("assets/img/more.png", width: 25, height: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
