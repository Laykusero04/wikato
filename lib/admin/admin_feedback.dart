import 'package:flutter/material.dart';

import 'admin_drawer.dart';

class AdminFeedback extends StatefulWidget {
  const AdminFeedback({super.key});

  @override
  State<AdminFeedback> createState() => _AdminFeedbackState();
}

class _AdminFeedbackState extends State<AdminFeedback> {
  // Sample feedback data
  final List<FeedbackItem> feedbackItems = List.generate(
    10,
    (index) => FeedbackItem(
      date: '10/25/2024',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Admin Feedback',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      drawer: AdminDrawer(),
      body: Column(
        children: [
          // Feedback Header with enhanced UI
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.red[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Feedback text
                const Text(
                  'Feedback',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Filter text with icon
                InkWell(
                  onTap: () {
                    // Add filter logic here
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.red,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Feedback list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: feedbackItems.length,
              itemBuilder: (context, index) {
                return FeedbackItemWidget(
                  feedbackItem: feedbackItems[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Feedback item data class
class FeedbackItem {
  final String date;
  final String content;

  FeedbackItem({
    required this.date,
    required this.content,
  });
}

// Feedback item widget with improved UI
class FeedbackItemWidget extends StatelessWidget {
  final FeedbackItem feedbackItem;

  const FeedbackItemWidget({
    super.key,
    required this.feedbackItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  feedbackItem.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Icon button for more options
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // More options (like delete, edit)
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),
            // Feedback content
            Text(
              feedbackItem.content,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
