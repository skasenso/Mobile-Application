import 'package:flutter/material.dart';
import 'courses_registration_screen.dart';


class FacultyDetailScreen extends StatelessWidget {
  final String facultyName;
  final Color color;

  const FacultyDetailScreen({
    super.key,
    required this.facultyName,
    required this.color,
  });

  // Generate a varied color for each department based on the faculty color and index
  Color _getDepartmentColor(int index) {
    final colors = [
      color,
      color.withOpacity(0.8),
      color.withOpacity(0.6),
      color.withOpacity(0.7),
    ];
    return colors[index % colors.length];
  }

  // Map of faculties to their programs
  final Map<String, List<Map<String, String>>> facultyPrograms = const {
    'Faculty of Science': [
      {
        'title': 'BSc Mathematics With Statistics',
        'description': 'Bachelor of Science in Mathematics with Statistics',
      },
      {
        'title': 'BSc Physics',
        'description': 'Bachelor of Science in Physics',
      },
      {
        'title': 'BSc Chemistry',
        'description': 'Bachelor of Science in Chemistry',
      },
      {
        'title': 'BSc Biology',
        'description': 'Bachelor of Science in Biology',
      },
    ],
    'School of Business': [
      {
        'title': 'BBA Banking & Finance',
        'description': 'Bachelor of Business Administration in Banking & Finance',
      },
      {
        'title': 'BBA In Accounting',
        'description': 'Bachelor of Business Administration in Accounting',
      },
      {
        'title': 'BBA HRM',
        'description': 'Bachelor of Business Administration in Human Resource Management',
      },
    ],
    'School of Education': [
      {
        'title': 'B.Ed English Language',
        'description': 'Bachelor of Education in English Language',
      },
      {
        'title': 'B.Ed Mathematics',
        'description': 'Bachelor of Education in Mathematics',
      },
      {
        'title': 'B.Ed Social Studies',
        'description': 'Bachelor of Education in Social Studies',
      },
    ],
    'Faculty of Arts and Social Sciences': [
      {
        'title': 'BA Theological Studies',
        'description': 'Bachelor of Arts in Theological Studies',
      },
      {
        'title': 'BSc Development Studies',
        'description': 'Bachelor of Science in Development Studies',
      },
      {
        'title': 'Diploma In Development Studies',
        'description': 'Diploma in Development Studies',
      },
    ],
    'School of Nursing and Midwifery': [
      {
        'title': 'BSc Mental Health Nursing',
        'description': 'Bachelor of Science, Mental Health Nursing',
      },
      {
        'title': 'BSc Midwifery',
        'description': 'Bachelor of Science, Midwifery',
      },
      {
        'title': 'B.Sc General Nursing',
        'description': 'Bachelor of Science in Nursing',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final programs = facultyPrograms[facultyName] ?? [];
    final isNursingFaculty = facultyName.toLowerCase().contains('nursing');
    final isScienceFaculty = facultyName.toLowerCase().contains('science');
    final isBusinessFaculty = facultyName.toLowerCase().contains('business');
    final isEducationFaculty = facultyName.toLowerCase().contains('education');
    final isArtsFaculty = facultyName.toLowerCase().contains('arts');
    final canRegisterCourses = isNursingFaculty || isScienceFaculty || isBusinessFaculty || isEducationFaculty || isArtsFaculty;

    return Scaffold(
      appBar: AppBar(
        title: Text(facultyName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with department-specific color variation
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _getDepartmentColor(index),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    program['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Body content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program['description']!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Free . 0 Lesson(s) . 0 Attachment(s)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: canRegisterCourses
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CoursesRegistrationScreen(
                                      departmentName: program['title']!,
                                      facultyColor: color,
                                    ),
                                  ),
                                );
                              }
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Course registration coming soon for this faculty'),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getDepartmentColor(index),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          canRegisterCourses ? 'Register Courses >' : 'Details >',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
