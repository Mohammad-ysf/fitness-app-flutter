import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/setting_slider_row.dart';
import '../../common_widget/setting_switch_row.dart';

class RunningSettingsView extends StatefulWidget {
  const RunningSettingsView({super.key});

  @override
  State<RunningSettingsView> createState() => _RunningSettingsViewState();
}

class _RunningSettingsViewState extends State<RunningSettingsView> {
  List settingArr = [
    {"name": "مسیریاب", "type": "switch", "value": "false"},
    {"name": "Auto Push", "type": "switch", "value": "false"},
    {"name": "توقف هنگام تماس تلفنی", "type": "switch", "value": "false"},
    {"name": "پیام صوتی", "type": "slider", "value": "50"},
    {"name": "زمان سنج", "type": "slider", "value": "50"},
    {"name": "فاصله", "type": "slider", "value": "50"},
    {"name": "میزان صدا", "type": "switch", "value": "true"},
    {"name": "زمان", "type": "switch", "value": "false"},
    {"name": "فاصله", "type": "switch", "value": "false"},
    {"name": "محاسبه سرعت", "type": "switch", "value": "false"},
    {"name": "محاسبه شتاب", "type": "switch", "value": "false"},
    {"name": "کالری شمار", "type": "switch", "value": "false"},
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
          "تنظیمات  ",
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
            } else if (tObj["type"] == "slider") {
              return SettingSliderRow(
                  tObj: tObj,
                  onChanged: (newVal) {
                    settingArr[index]["value"] = newVal.toString();
                    setState(() {});
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
    );
  }
}