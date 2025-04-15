// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../utils/navbar.dart';
import 'taxi_company_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color themeRed = const Color(0xFFDB2A2A);

  String selectedSort = 'Rating';
  String selectedFilter = 'All';

  List<Map<String, dynamic>> taxiCompanies = [
    {
      "name": "City Cabs",
      "phone": "+387 61 123 456",
      "freeCars": 5,
      "rating": 4.5,
    },
    {
      "name": "Turbo Taxi",
      "phone": "+387 62 789 012",
      "freeCars": 2,
      "rating": 4.2,
    },
    {
      "name": "Express Ride",
      "phone": "+387 63 555 888",
      "freeCars": 0,
      "rating": 4.8,
    },
    {
      "name": "FastGo",
      "phone": "+387 64 999 777",
      "freeCars": 8,
      "rating": 4.6,
    },
  ];

  List<Map<String, dynamic>> getFilteredSortedCompanies() {
    List<Map<String, dynamic>> filtered = [...taxiCompanies];

    // Filter
    if (selectedFilter == 'Only Available') {
      filtered = filtered.where((c) => c['freeCars'] > 0).toList();
    }

    // Sort
    if (selectedSort == 'Rating') {
      filtered.sort((a, b) => (b['rating']).compareTo(a['rating']));
    } else if (selectedSort == 'Free Cars') {
      filtered.sort((a, b) => (b['freeCars']).compareTo(a['freeCars']));
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final companies = getFilteredSortedCompanies();

    return Scaffold(
      appBar: AppBar(
        title: const Text("PickMeUp - Taxi Companies"),
        backgroundColor: themeRed,
      ),
      drawer: const NavMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ Sort and Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedSort,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      icon: const Icon(Icons.arrow_drop_down),
                      items: [
                        DropdownMenuItem(
                          value: 'Rating',
                          child: Row(
                            children: const [
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              SizedBox(width: 8),
                              Text("Sort by Rating"),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Free Cars',
                          child: Row(
                            children: const [
                              Icon(
                                Icons.directions_car,
                                size: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 8),
                              Text("Sort by Free Cars"),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedSort = value!;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade100,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedFilter,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      icon: const Icon(Icons.arrow_drop_down),
                      items: [
                        DropdownMenuItem(
                          value: 'All',
                          child: Row(
                            children: const [
                              Icon(Icons.list, size: 16, color: Colors.black),
                              SizedBox(width: 8),
                              Text("Show All"),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Only Available',
                          child: Row(
                            children: const [
                              Icon(
                                Icons.check_circle,
                                size: 16,
                                color: Colors.green,
                              ),
                              SizedBox(width: 8),
                              Text("Only Available"),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedFilter = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
                children:
                    companies.map((company) {
                      final int freeCars = company["freeCars"];
                      final String status;
                      final Color statusColor;

                      if (freeCars >= 5) {
                        status = "Available";
                        statusColor = Colors.green;
                      } else if (freeCars >= 1) {
                        status = "Low Availability";
                        statusColor = Colors.orange;
                      } else {
                        status = "No Cars";
                        statusColor = Colors.red;
                      }

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) =>
                                      TaxiCompanyDetailScreen(company: company),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: themeRed.withOpacity(
                                        0.1,
                                      ),
                                      child: const Icon(
                                        Icons.local_taxi,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        company["name"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            company["phone"],
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.directions_car,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "$freeCars free",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "${company["rating"]} ★",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: statusColor.withOpacity(0.1),
                                      border: Border.all(color: statusColor),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      status,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: statusColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
