import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/tab_button.dart';
import '../workout/workout_detail_view.dart';

class MealPlanView extends StatefulWidget {
  const MealPlanView({super.key});

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  int isActiveTab = 0;

  List planArr = [

    {
      "name": "میان وعده",
      "image": "assets/img/f2.png",
      "title": "میان وعده ایده‌آل",
      "subtitle": "برای حفظ سطح انرژی و تمرکز در طول روز، یک میان وعده سالم و پر از مواد مغذی ضروری است. این وعده به شما کمک می‌کند تا در تمرینات بعدی بیشترین عملکرد را داشته باشید."
    },
    {
      "name": "ناهار",
      "image": "assets/img/f3.png",
      "title": "تغذیه قدرتمند برای ناهار",
      "subtitle": "ناهار خود را با ترکیبی از پروتئین با کیفیت، کربوهیدرات‌های پیچیده و چربی‌های سالم پر کنید. این وعده به بازسازی عضلات کمک کرده و شما را برای تمرینات بعدی آماده می‌کند."
    },
    {
      "name": "میان وعده بعد از ظهر",
      "image": "assets/img/f4.png",
      "title": "میان وعده عصرگاهی",
      "subtitle": "یک میان وعده مغذی بعد از ظهر به حفظ انرژی شما کمک می‌کند و از افت انرژی در طول روز جلوگیری می‌کند. این وعده برای بازسازی سریع عضلات و تقویت عملکرد ورزشی ضروری است."
    },
  ];


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 25,
              height: 25,
            )),
        title: Text(
          "برنامه غذایی",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: TColor.white, boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
            ]),
            child: Row(
              children: [
                Expanded(
                  child: TabButton(
                    title: "آب",
                    isActive: isActiveTab == 0,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TabButton(
                    title: "غذا",
                    isActive: isActiveTab == 1,
                    onPressed: () {
                      setState(() {
                        isActiveTab = 1;
                      });
                    },
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/black_fo.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    "پنج شنبه , 20 دی",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/img/next_go.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding:
                const EdgeInsets.symmetric( horizontal: 20),
                itemCount: planArr.length,
                itemBuilder: (context, index) {
                  var wObj = planArr[index] as Map? ?? {};
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: media.width * 0.5,
                    decoration: BoxDecoration(
                        color: TColor.gray,
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Image.asset(
                          wObj["image"].toString(),
                          width: media.width,
                          height: media.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: media.width,
                          height: media.width * 0.5,
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Colors.black.withOpacity(0.7)
                                : TColor.gray.withOpacity(0.35),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wObj["title"],
                                style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                wObj["name"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                wObj["subtitle"],
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      height: 25,
                                      child: RoundButton(
                                        title: "بیشتر",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const WorkoutDetailView()));
                                        },
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
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
