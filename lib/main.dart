import 'package:dashboard/route_generator.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'my_global_vars.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globals.isDark ? globals.lightMode : globals.darkMode,
      initialRoute: 'DashBoard',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          backgroundColor: globals.getModeBackGroundColour(),
        ),
        backgroundColor: globals.getModeBackGroundColour(),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 25.0),
                  child: Text(
                    "Johny's Family",
                    style: TextStyle(
                      fontSize: 30,
                      color: globals.getTextColour(),
                    ),
                  ),
                ),
                const SizedBox(width: 135),
                Badge(
                    padding: const EdgeInsetsDirectional.all(4),
                    badgeContent: const Text(
                      '1',
                      style: TextStyle(fontSize: 10),
                    ),
                    elevation: 2,
                    badgeColor: Colors.red,
                    position: BadgePosition.topEnd(end: -1),
                    shape: BadgeShape.circle,
                    animationType: BadgeAnimationType.slide,
                    ignorePointer: false,
                    child: Icon(
                      Icons.comment_rounded,
                      color: globals.getIconColour(),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 30),
                  child: Text(
                    'Home',
                    style:
                        TextStyle(fontSize: 15, color: globals.getIconColour()),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 16,
                  color: Colors.grey,
                )
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(choices.length, (index) {
                    return Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, choices[index].routeName as String);
                        },
                        child: SelectCard(
                          choice: choices[index],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice(
      {required this.title,
      required this.icon,
      this.iconColour,
      this.routeName});

  final String title;
  final IconData icon;
  final Color? iconColour;
  final String? routeName;
}

const List<Choice> choices = <Choice>[
  Choice(
      title: 'Calendar',
      icon: Icons.calendar_today_rounded,
      iconColour: Colors.blue,
      routeName: 'Calendar'),
  Choice(
      title: 'Groceries',
      icon: Icons.local_grocery_store,
      iconColour: Colors.red,
      routeName: 'Groceries'),
  Choice(
      title: 'Location',
      icon: Icons.location_on,
      iconColour: Colors.red,
      routeName: 'Location'),
  Choice(
      title: 'Activity',
      icon: Icons.notifications,
      iconColour: Colors.orangeAccent,
      routeName: 'Activity'),
  Choice(
      title: 'To Do',
      icon: Icons.checklist_outlined,
      iconColour: Colors.green,
      routeName: 'To Do'),
  Choice(
      title: 'Settings',
      icon: Icons.settings,
      iconColour: Colors.deepPurpleAccent,
      routeName: 'Settings')
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: globals.isDark ? const Color(0xFF453657) : Colors.white70,
        elevation: 2.0,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon, size: 60.0, color: choice.iconColour),
                const SizedBox(
                  height: 15,
                ),
                Text(choice.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: globals.getTextColour(),
                    )),
              ]),
        ));
  }
}
