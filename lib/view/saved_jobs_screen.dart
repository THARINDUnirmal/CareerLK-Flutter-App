import 'package:flutter/material.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  final List<Map<String, dynamic>> savedJobs = [
    {
      "title": "Flutter Developer",
      "company": "Tech Solutions",
      "location": "Colombo",
      "salary": "Rs. 120K",
      "type": "Full Time",
      "logo": "assets/images/company1.png",
      "saved": true,
    },
    {
      "title": "UI/UX Designer",
      "company": "Creative Studio",
      "location": "Kandy",
      "salary": "Rs. 90K",
      "type": "Full Time",
      "logo": "assets/images/company2.png",
      "saved": true,
    },
    {
      "title": "Software Engineer",
      "company": "Digital Labs",
      "location": "Colombo",
      "salary": "Rs. 150K",
      "type": "Full Time",
      "logo": "assets/images/company3.png",
      "saved": true,
    },
    {
      "title": "Mobile App Developer",
      "company": "Innovate Lanka",
      "location": "Remote",
      "salary": "Rs. 100K",
      "type": "Remote",
      "logo": "assets/images/company1.png",
      "saved": true,
    },
  ];

  void removeJob(int index) {
    setState(() {
      savedJobs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      body: SafeArea(
        child: Column(
          children: [
            // ============================================
            // HEADER
            // ============================================

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color(0xFF263238),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Title
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saved Jobs",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF18212A),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Jobs you've saved for later",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7B8794),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bookmark icon
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF5FF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.bookmark_rounded,
                      color: Color(0xFF2196F3),
                      size: 21,
                    ),
                  ),
                ],
              ),
            ),

            // ============================================
            // SAVED COUNT
            // ============================================
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 15),
              child: Row(
                children: [
                  Text(
                    "${savedJobs.length} Saved Jobs",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF53616D),
                    ),
                  ),

                  const Spacer(),

                  TextButton(
                    onPressed: () {
                      // Optional: clear all
                    },
                    child: const Text(
                      "Manage",
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ============================================
            // JOB LIST
            // ============================================
            Expanded(
              child: savedJobs.isEmpty
                  ? _emptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: savedJobs.length,
                      itemBuilder: (context, index) {
                        final job = savedJobs[index];

                        return Dismissible(
                          key: ValueKey("${job["title"]}_$index"),

                          direction: DismissDirection.endToStart,

                          background: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE8E8),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 22),
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              color: Color(0xFFE74C3C),
                              size: 24,
                            ),
                          ),

                          onDismissed: (_) {
                            removeJob(index);
                          },

                          child: _savedJobCard(
                            job: job,
                            onRemove: () {
                              removeJob(index);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ======================================================
  // SAVED JOB CARD
  // ======================================================

  Widget _savedJobCard({
    required Map<String, dynamic> job,
    required VoidCallback onRemove,
  }) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          // ============================================
          // COMPANY LOGO
          // ============================================

          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(9),

            decoration: BoxDecoration(
              color: const Color(0xFFF3F6F9),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Image.asset(job["logo"], fit: BoxFit.contain),
          ),

          const SizedBox(width: 13),

          // ============================================
          // JOB DETAILS
          // ============================================
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job["title"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18212A),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  job["company"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF75818C),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xFF8B96A0),
                    ),

                    const SizedBox(width: 3),

                    Flexible(
                      child: Text(
                        job["location"],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF8B96A0),
                        ),
                      ),
                    ),

                    const SizedBox(width: 9),

                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Color(0xFF8B96A0),
                    ),

                    const SizedBox(width: 3),

                    Text(
                      job["type"],
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF8B96A0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // ============================================
          // RIGHT SIDE
          // ============================================
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Remove saved
              GestureDetector(
                onTap: onRemove,
                child: Container(
                  width: 34,
                  height: 34,

                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF5FF),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Icon(
                    Icons.bookmark_rounded,
                    size: 18,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ),

              Text(
                job["salary"],
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2196F3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ======================================================
  // EMPTY STATE
  // ======================================================

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,

              decoration: BoxDecoration(
                color: const Color(0xFFEAF5FF),
                borderRadius: BorderRadius.circular(28),
              ),

              child: const Icon(
                Icons.bookmark_border_rounded,
                size: 42,
                color: Color(0xFF2196F3),
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              "No Saved Jobs Yet",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF18212A),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Save jobs you're interested in and\n"
              "find them here when you're ready.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Color(0xFF7B8794),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "EXPLORE JOBS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
