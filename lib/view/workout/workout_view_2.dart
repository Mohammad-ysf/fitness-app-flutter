import 'package:fitness_app/view/workout/workout_detail_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class WorkoutView2 extends StatefulWidget {
  const WorkoutView2({super.key});

  @override
  State<WorkoutView2> createState() => _WorkoutView2State();
}

class _WorkoutView2State extends State<WorkoutView2> {
  List workArr = [
    {"name": "Push-Up", "image": "assets/img/1.png"},
    {"name": "Leg extension", "image": "assets/img/2.png"},
    {"name": "Push-Up", "image": "assets/img/5.png"},
    {"name": "Climber", "image": "assets/img/3.png"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    var itemHeight = (media.height - kToolbarHeight -
        kBottomNavigationBarHeight) / 2;

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
          "Workout",
          style: TextStyle(
              color: TColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: media.width / (itemHeight * 2),
        ),
        itemCount: workArr.length,
        itemBuilder: (context, index) {
          var wObj = workArr[index] as Map? ?? {};
          return Container(
            decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
                alignment: Alignment.center,
                children: [
            Image.asset(
            wObj["image"].toString(),
            width: media.width / 2,
            height: itemHeight * 0.75,
            fit: BoxFit.cover,
          ),
          Container(
          width: media.width / 2,
          height: itemHeight * 0.75,
          decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
          Colors.black.withOpacity(0.7),
          Colors.black.withOpacity(0.3)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailView(
                  ),
                ),
              );
            },
          borderRadius: BorderRadius.circular(8),
          child:Image.asset(
          "assets/img/play.png",
          width: 35,
          height: 35,
          ),
          ),
          ),

          ],
          ),
          ),
          Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          wObj["name"],
          style: TextStyle(
          color: TColor.secondaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700),
          ),
          ],
          ),
          ),
          ],
          ),
          );
          },
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
