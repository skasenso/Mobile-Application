import 'package:flutter/material.dart';
import 'departments_screen.dart';
import 'department_detail_screen.dart';
import 'faculty_screen.dart';


void main() {
  runApp(const CampusDirectoryApp());
}


class CampusDirectoryApp extends StatelessWidget {
  const CampusDirectoryApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VVU Campus Directory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/departments': (context) => const DepartmentsScreen(),
        '/faculty': (context) => const FacultyScreen(),
        '/department/detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return DepartmentDetailScreen(departmentName: args['name']);
        },
      },
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VVU Campus Directory'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey.shade50, Colors.grey.shade100],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with VVU Branding
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // VVU Logo Representation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Box with VVU
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1B3B7A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'VVU',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Column(
                                  children: [
                                    Container(width: 3, height: 12, color: Colors.amber.shade600),
                                    const SizedBox(height: 2),
                                    Container(width: 3, height: 12, color: Colors.amber.shade600),
                                    const SizedBox(height: 2),
                                    Container(width: 3, height: 12, color: Colors.amber.shade600),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        // University Name Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'VALLEY VIEW',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1B3B7A),
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                'UNIVERSITY',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1B3B7A),
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "GHANA'S PREMIER CHARTERED\nPRIVATE UNIVERSITY",
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade600,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Motto
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: const Color(0xFF1B3B7A),
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: const Color(0xFF1B3B7A),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        'Excellence | Integrity | Service',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1B3B7A),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // Welcome Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Welcome to VVU Directory',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B3B7A),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Browse departments, explore faculties, and register for courses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/departments');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'View Departments',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/faculty');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'View Faculty',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
