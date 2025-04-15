import 'package:flutter/material.dart';

class TaxiCompanyDetailScreen extends StatefulWidget {
  final Map<String, dynamic> company;

  const TaxiCompanyDetailScreen({super.key, required this.company});

  @override
  State<TaxiCompanyDetailScreen> createState() =>
      _TaxiCompanyDetailScreenState();
}

class _TaxiCompanyDetailScreenState extends State<TaxiCompanyDetailScreen> {
  final List<Map<String, String>> comments = [
    {"user": "John", "comment": "Great service!", "rating": "5"},
    {"user": "Sara", "comment": "Very fast and polite.", "rating": "4"},
  ];

  final TextEditingController _commentController = TextEditingController();
  double _userRating = 5;

  @override
  Widget build(BuildContext context) {
    final company = widget.company;
    final themeRed = const Color(0xFFDB2A2A);

    return Scaffold(
      appBar: AppBar(title: Text(company['name']), backgroundColor: themeRed),
      body: GestureDetector(
        onTap:
            () => FocusScope.of(context).unfocus(), // dismiss keyboard on tap
        child: LayoutBuilder(
          builder:
              (context, constraints) => SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🟡 Info Section
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  company['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.phone, size: 20),
                                    const SizedBox(width: 8),
                                    Text(company['phone']),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(Icons.directions_car, size: 20),
                                    const SizedBox(width: 8),
                                    Text("Free Cars: ${company['freeCars']}"),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(Icons.star, size: 20),
                                    const SizedBox(width: 8),
                                    Text("Rating: ${company['rating']}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // 🟢 Request Ride Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.local_taxi),
                            label: const Text("Request Ride"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeRed,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // TODO: Implement ride request
                            },
                          ),
                        ),

                        const SizedBox(height: 24),

                        // 🔵 Comments Section
                        // 🔵 Comments Section
                        const Text(
                          "Ratings & Comments",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height *
                              0.25, // Adjust height as needed
                          child: ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (_, index) {
                              final item = comments[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: ListTile(
                                  tileColor: Colors.grey.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  leading: const Icon(Icons.person),
                                  title: Text(item['user']!),
                                  subtitle: Text(item['comment']!),
                                  trailing: Text("${item['rating']} ⭐"),
                                ),
                              );
                            },
                          ),
                        ),

                        const Divider(height: 40),

                        // 🟣 Leave a Comment
                        const Text(
                          "Leave a Rating",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Slider(
                          value: _userRating,
                          min: 1,
                          max: 5,
                          divisions: 4,
                          label: _userRating.round().toString(),
                          activeColor: themeRed,
                          onChanged: (value) {
                            setState(() => _userRating = value);
                          },
                        ),
                        TextField(
                          controller: _commentController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Write your comment...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeRed,
                            ),
                            child: const Text("Submit"),
                            onPressed: () {
                              if (_commentController.text.isNotEmpty) {
                                setState(() {
                                  comments.add({
                                    "user": "You",
                                    "comment": _commentController.text,
                                    "rating": _userRating.round().toString(),
                                  });
                                  _commentController.clear();
                                  _userRating = 5;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
