import 'package:flutter/material.dart';
import 'student_id_manager.dart';

class RegistrationConfirmationScreen extends StatelessWidget {
  final String departmentName;
  final List<Map<String, String>> registeredCourses;
  final Color facultyColor;
  final String studentName;
  final String studentID;

  const RegistrationConfirmationScreen({
    super.key,
    required this.departmentName,
    required this.registeredCourses,
    required this.facultyColor,
    required this.studentID,
    this.studentName = 'Student Account',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: facultyColor,
        title: const Text('Registration Confirmed'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Success Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [facultyColor, facultyColor.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Registration Successful!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${registeredCourses.length} courses registered',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Student Profile Card
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        facultyColor.withOpacity(0.08),
                        Colors.white,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: facultyColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: facultyColor.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  studentName,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ID: ${StudentIDManager.formatStudentID(studentID)}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                    fontFamily: 'Courier',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoSection(
                            'Program',
                            departmentName,
                          ),
                          _buildInfoSection(
                            'Department',
                            StudentIDManager.getDepartmentCode(departmentName),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoSection(
                            'Semester',
                            'First (2023)',
                          ),
                          _buildInfoSection(
                            'Status',
                            'Registered',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Registered Courses Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Registered Courses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...registeredCourses.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final course = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Transform(
                          transform: Matrix4.identity()..setEntry(3, 2, 0.001),
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  facultyColor.withOpacity(0.12),
                                  Colors.white,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: facultyColor.withOpacity(0.3),
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: facultyColor.withOpacity(0.1),
                                  offset: const Offset(0, 4),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: facultyColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: facultyColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course['name']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: facultyColor.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          'Code: ${course['code']}',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: facultyColor,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Download or print functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Confirmation email sent!'),
                          backgroundColor: facultyColor,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: const Icon(Icons.mail),
                    label: const Text('Send to Email'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: facultyColor,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    icon: const Icon(Icons.home),
                    label: const Text('Back to Home'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: facultyColor),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: facultyColor,
          ),
        ),
      ],
    );
  }
}
