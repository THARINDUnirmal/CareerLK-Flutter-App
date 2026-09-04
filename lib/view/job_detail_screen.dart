import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  Future<void> openMap() async {
    final Uri mapUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Colombo+Sri+Lanka',
    );

    if (await canLaunchUrl(mapUrl)) {
      await launchUrl(mapUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      // BOTTOM APPLY BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Apply job
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2196F3),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "APPLY NOW",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // APP BAR

            SliverAppBar(
              backgroundColor: const Color(0xFFF4F6FA),
              elevation: 0,
              pinned: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Color(0xFF263238),
                    ),
                  ),
                ),
              ),
              leadingWidth: 61,

              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border_rounded,
                      color: Color(0xFF263238),
                      size: 21,
                    ),
                  ),
                ),
              ],
            ),

            // CONTENT
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // COMPANY LOGO

                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Image.asset(
                        "assets/images/company1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // JOB TITLE
                  const Text(
                    "Flutter Developer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18212A),
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    "Tech Solutions Pvt Ltd",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF75818C),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 17,
                        color: Color(0xFF2196F3),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Colombo, Sri Lanka",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF75818C),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // JOB INFO
                  Row(
                    children: [
                      Expanded(
                        child: _infoBox(
                          icon: Icons.access_time_rounded,
                          title: "Job Type",
                          value: "Full Time",
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _infoBox(
                          icon: Icons.payments_outlined,
                          title: "Salary",
                          value: "Rs. 120K",
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _infoBox(
                          icon: Icons.work_outline,
                          title: "Experience",
                          value: "1-2 Years",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // ABOUT JOB
                  const Text(
                    "About the Job",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18212A),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "We are looking for a passionate Flutter Developer "
                    "to join our growing development team. You will be "
                    "responsible for building beautiful, scalable and "
                    "high-performance mobile applications.",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Color(0xFF71808C),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // REQUIREMENTS
                  const Text(
                    "Requirements",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18212A),
                    ),
                  ),

                  const SizedBox(height: 12),

                  _requirement("1", "Good knowledge of Flutter and Dart"),

                  _requirement("2", "Experience with REST APIs"),

                  _requirement("3", "Understanding of Git and GitHub"),

                  _requirement("4", "Good problem-solving skills"),

                  const SizedBox(height: 25),

                  // JOB LOCATION
                  const Text(
                    "Job Location",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18212A),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAF5FF),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: const Icon(
                                Icons.location_on_rounded,
                                color: Color(0xFF2196F3),
                                size: 22,
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tech Solutions Pvt Ltd",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF263238),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Colombo 03, Sri Lanka",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF7B8794),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // MAP BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton.icon(
                            onPressed: openMap,
                            icon: const Icon(Icons.map_outlined, size: 19),
                            label: const Text("VIEW LOCATION ON MAP"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF2196F3),
                              side: const BorderSide(color: Color(0xFF2196F3)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // COMPANY
                  const Text(
                    "About Company",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18212A),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Tech Solutions is a software development company "
                    "focused on creating innovative digital products "
                    "and mobile applications.",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Color(0xFF71808C),
                    ),
                  ),

                  const SizedBox(height: 30),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // INFO BOX

  static Widget _infoBox({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF2196F3), size: 20),

          const SizedBox(height: 7),

          Text(
            title,
            style: const TextStyle(fontSize: 10, color: Color(0xFF8A96A1)),
          ),

          const SizedBox(height: 3),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF34414D),
            ),
          ),
        ],
      ),
    );
  }

  // REQUIREMENT

  static Widget _requirement(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5FF),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2196F3),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Color(0xFF66737E)),
            ),
          ),
        ],
      ),
    );
  }
}
