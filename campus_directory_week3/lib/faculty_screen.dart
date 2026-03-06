import 'package:flutter/material.dart';
import 'faculty_detail_screen.dart';

class Faculty {
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> departments;

  const Faculty({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.departments,
  });
}

class FacultyScreen extends StatelessWidget {
  const FacultyScreen({super.key});

  final List<Faculty> faculties = const [
    // Faculty of Science: Bright Blue (science, mathematics, physics, chemistry, biology)
    Faculty(
      name: 'Faculty 1',
      description: 'Faculty of Science',
      icon: Icons.science,
      color: Color(0xFF1E88E5), // Science Bright Blue
      departments: ['Mathematics', 'Physics', 'Chemistry', 'Biology'],
    ),
    // School of Business: Red/Maroon (banking, finance, accounting, HRM)
    Faculty(
      name: 'Faculty 2',
      description: 'School of Business',
      icon: Icons.business_center,
      color: Color(0xFFC62828), // Business Red
      departments: ['Banking & Finance', 'Accounting', 'Human Resource Management'],
    ),
    // School of Education: Green (teaching, learning, pedagogy)
    Faculty(
      name: 'Faculty 3',
      description: 'School of Education',
      icon: Icons.school,
      color: Color(0xFF388E3C), // Education Green
      departments: ['English Language', 'Mathematics', 'Social Studies'],
    ),
    // Faculty of Arts and Social Sciences: Orange/Amber (humanities, social development)
    Faculty(
      name: 'Faculty 4',
      description: 'Faculty of Arts and Social Sciences',
      icon: Icons.palette,
      color: Color(0xFFF57C00), // Arts Orange
      departments: ['Theology', 'Development Studies', 'Humanities'],
    ),
    // School of Nursing and Midwifery: Teal/Green (healthcare, medical)
    Faculty(
      name: 'Faculty 5',
      description: 'School of Nursing and Midwifery',
      icon: Icons.local_hospital,
      color: Color(0xFF00796B), // Healthcare Teal
      departments: ['Mental Health Nursing', 'Midwifery', 'General Nursing'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 0,
        toolbarHeight: 140,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo and University Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VVU Logo
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A8A),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFFFA500),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'VVU',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // University Name and Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'VALLEY VIEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'UNIVERSITY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "GHANA'S PREMIER CHARTERED\nPRIVATE UNIVERSITY",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Motto with decorative lines
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xFFFFA500),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Excellence | Integrity | Service',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: const Color(0xFFFFA500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          final f = faculties[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacultyDetailScreen(
                      facultyName: f.description,
                      color: f.color,
                    ),
                  ),
                );
              },
              child: Transform(
                transform: Matrix4.identity()..setEntry(3, 2, 0.001),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [f.color.withOpacity(0.12), Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        offset: const Offset(0, 6),
                        blurRadius: 12,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        offset: const Offset(-6, -6),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    leading: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: f.color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: f.color.withOpacity(0.4),
                            offset: const Offset(0, 6),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Icon(
                        f.icon,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      f.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(f.description),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: f.departments
                              .map(
                                (dept) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: f.color.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    dept,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

