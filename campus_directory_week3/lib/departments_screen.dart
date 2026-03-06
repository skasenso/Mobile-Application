import 'package:flutter/material.dart';
import 'department_detail_screen.dart';


class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({super.key});

  final List<Map<String, dynamic>> departments = const [
    {
      'title': 'Computer Science',
      'subtitle': 'Department of Computing Sciences',
      'icon': Icons.computer,
      'color': Color(0xFFFFFFFF), // White
    },
    {
      'title': 'Engineering',
      'subtitle': 'School of Engineering',
      'icon': Icons.engineering,
      'color': Color(0xFFFFFFFF), // White
    },
    {
      'title': 'Business Administration',
      'subtitle': 'School of Business',
      'icon': Icons.business,
      'color': Color(0xFFFFFFFF), // White
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: departments.length,
          itemBuilder: (context, index) {
            final dept = departments[index];
            const textColor = Colors.black87;
            const subtitleColor = Colors.black54;

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepartmentDetailScreen(
                        departmentName: dept['title'],
                      ),
                    ),
                  );
                },
                child: Transform(
                  transform: Matrix4.identity()..setEntry(3, 2, 0.001),
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          offset: const Offset(0, 8),
                          blurRadius: 16,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.6),
                          offset: const Offset(-6, -6),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              dept['icon'],
                              color: textColor,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dept['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  dept['subtitle'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: subtitleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
