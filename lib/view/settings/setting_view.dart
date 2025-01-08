import 'package:fitness_app/view/settings/select_language_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/setting_select_row.dart';
import '../../common_widget/setting_switch_row.dart';
import 'connect_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  List settingArr = [
    {"name": "یادآوری", "type": "switch", "value": "false"},
    {"name": "زبان", "type": "select", "value": "ENGLISH"},
    {"name": "متصل شده", "type": "select", "value": "Facebook"},
    {"name": "سلامت کامل", "type": "switch", "value": "true"},
    {"name": "گرم کردن", "type": "switch", "value": "false"},
    {"name": "سرد کردن", "type": "switch", "value": "false"},
    {"name": "اظلاع رسانی", "type": "switch", "value": "false"},
    {"name": "توقف فرایند ها هنگام دویدن", "type": "switch", "value": "false"}
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
          "تنظیمات",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            var tObj = settingArr[index] as Map? ?? {};

            if (tObj["type"] == "switch") {
              return SettingSwitchRow(
                  tObj: tObj,
                  onChanged: (newVal) {
                    settingArr[index]["value"] = newVal ? "true" : "false";
                    setState(() {});
                  });
            } else if (tObj["type"] == "select") {
              return SettingSelectRow(
                  tObj: tObj,
                  onPressed: () {
                    if (tObj["name" ] == "زبان") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SelectLanguageView(didSelect: (newVal) {})));
                    }else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ConnectView(didSelect: (newVal) {})));
                    }
                  });
            } else {
              return Container();
            }
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black26,
              height: 1,
            );
          },
          itemCount: settingArr.length),
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
