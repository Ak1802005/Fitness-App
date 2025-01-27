
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workout_fitness/Database/auth_controller.dart';
import 'package:workout_fitness/view/home/home_view.dart';
import 'package:workout_fitness/view/login/on_boarding_view.dart';
import 'package:workout_fitness/view/menu/yoga_view.dart';
import 'package:workout_fitness/view/settings/setting_view.dart';
import '../../Login/login.dart';
import '../../common/color_extension.dart';
import '../../common_widget/menu_cell.dart';
import '../exercise/exercise_view_2.dart';
import '../meal_plan/meal_plan_view_2.dart';
import '../running/running_view.dart';
import '../schedule/schedule_view.dart';
import '../tips/tips_view.dart';
import '../weight/weight_view.dart';

class MenuView extends StatefulWidget {
  MenuView({super.key, this.username});

  String? username;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final ctrl = Get.find<AuthControl>();
  List planArr = [
    {
      "name": "Running",
      "icon": "assets/img/menu_running.png",
      "right_icon": "",
    },
    {
      "name": "Yoga",
      "icon": "assets/img/yoga.png",
      "right_icon": "assets/img/information.png",
    },
    {
      "name": "Workout",
      "icon": "assets/img/workout.png",
      "right_icon": "",
    },
    {
      "name": "Walking",
      "icon": "assets/img/walking.png",
      "right_icon": "",
    },
    {
      "name": "Fitness",
      "icon": "assets/img/fitness.png",
      "right_icon": "assets/img/information.png",
    },
    {
      "name": "Strength",
      "icon": "assets/img/strength.png",
      "right_icon": "",
    }
  ];

  List menuArr = [
    {"name": "Home", "image": "assets/img/menu_home.png", "tag": "1"},
    {"name": "Weight", "image": "assets/img/menu_weight.png", "tag": "2"},
    {
      "name": "Traning plan",
      "image": "assets/img/menu_traning_plan.png",
      "tag": "3"
    },
    {
      "name": "Personal Status",
      "image": "assets/img/menu_traning_status.png",
      "tag": "4"
    },
    {"name": "Meal Plan", "image": "assets/img/menu_meal_plan.png", "tag": "5"},
    {"name": "Schedule", "image": "assets/img/menu_schedule.png", "tag": "6"},
    {"name": "Running", "image": "assets/img/menu_running.png", "tag": "7"},
    {"name": "Yoga", "image": "assets/img/yoga.png", "tag": "8"},
    {"name": "Exercises", "image": "assets/img/menu_exercises.png", "tag": "9"},
    {"name": "Tips", "image": "assets/img/menu_tips.png", "tag": "10"},
    {"name": "Settings", "image": "assets/img/menu_settings.png", "tag": "11"},
    {"name": "Log Out", "image": "assets/img/menu_support.png", "tag": "12"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: media.width * 0.6,
                collapsedHeight: kToolbarHeight + 20,
                flexibleSpace: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      "assets/img/1.png",
                      width: media.width,
                      height: media.width * 0.8,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.8,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: Row(
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                                color: TColor.white,
                                borderRadius: BorderRadius.circular(27)),
                            alignment: Alignment.center,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/img/u1.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(widget.username ?? "",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: TColor.white,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("Profile",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: TColor.white,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ];
          },
          body: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1),
            itemCount: menuArr.length,
            itemBuilder: ((context, index) {
              var mObj = menuArr[index] as Map? ?? {};
              return MenuCell(
                mObj: mObj,
                onPressed: () {
                  switch (mObj["tag"].toString()) {
                    case "1":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()));
                      break;
                    case "2":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeightView()));
                      break;
                    case "3":
                      Scaffold.of(context).openDrawer();
                      break;
                    case "4":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoardingView()));
                      break;
                    case "5":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MealPlanView2()));
                      break;
                    case "6":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScheduleView()));
                      break;
                    case "7":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RunningView()));
                      break;
                    case "8":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const YogaView()));
                      break;
                    case "9":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExerciseView2()));
                      break;
                    case "10":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TipsView()));
                      break;
                    case "11":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsView()));
                      break;
                    case "12":
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreens()));
                    default:
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
