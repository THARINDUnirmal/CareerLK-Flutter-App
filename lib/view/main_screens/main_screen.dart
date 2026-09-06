import 'package:career_lk/view/main_screens/add_job_screen.dart';
import 'package:career_lk/view/main_screens/home_screen.dart';
import 'package:career_lk/view/main_screens/profile_screen.dart';
import 'package:career_lk/view/main_screens/saved_jobs_screen.dart';
import 'package:career_lk/view/main_screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    AddJobScreen(),
    SavedJobsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadiusGeometry.circular(100),
      //   ),
      //   child: Center(child: Icon(Icons.add)),
      // ),

      body: screens[selectedIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
          child: SizedBox(
            height: 60,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _navItem(icon: Icons.dashboard_outlined, index: 0),

                      _navItem(icon: Icons.search, index: 1),

                      const SizedBox(width: 55),

                      _navItem(icon: Icons.bookmark_border, index: 3),

                      _navItem(icon: Icons.person, index: 4),
                    ],
                  ),
                ),

                Positioned(
                  top: -12,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xff1478c6),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========================
  // NAV ITEM
  // =========================
  Widget _navItem({required IconData icon, required int index}) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: SizedBox(
        width: 40,
        height: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: isSelected
                  ? const Color(0xFF32966F)
                  : Colors.grey.shade400,
            ),

            const SizedBox(height: 4),

            // Selected indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 5 : 0,
              height: isSelected ? 5 : 0,
              decoration: const BoxDecoration(
                color: Color(0xFF32966F),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
