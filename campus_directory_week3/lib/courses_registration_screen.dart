import 'package:flutter/material.dart';
import 'registration_confirmation_screen.dart';
import 'student_id_manager.dart';


class CoursesRegistrationScreen extends StatefulWidget {
  final String departmentName;
  final Color facultyColor;

  const CoursesRegistrationScreen({
    super.key,
    required this.departmentName,
    required this.facultyColor,
  });

  @override
  State<CoursesRegistrationScreen> createState() =>
      _CoursesRegistrationScreenState(facultyColor);
}

class _CoursesRegistrationScreenState extends State<CoursesRegistrationScreen> {
  final Color facultyColor;
  Set<String> selectedCourses = {};
  static const int maxCourses = 6;
  late String generatedStudentID;
  late String departmentCode;

  _CoursesRegistrationScreenState(this.facultyColor);

  @override
  void initState() {
    super.initState();
    // Extract department code and generate student ID
    departmentCode = StudentIDManager.getDepartmentCode(widget.departmentName);
    generatedStudentID = StudentIDManager.generateStudentID(
      departmentCode: departmentCode,
      year: 2023,
    );
  }

  List<Map<String, String>> getCourses() {
    // Check if this is a science faculty program
    final isScienceFaculty = widget.departmentName.contains('BSc') && 
        (widget.departmentName.contains('Mathematics') ||
         widget.departmentName.contains('Physics') ||
         widget.departmentName.contains('Chemistry') ||
         widget.departmentName.contains('Biology'));
    
    // Check if this is a business faculty program
    final isBusinessFaculty = widget.departmentName.contains('BBA') ||
        (widget.departmentName.contains('Banking') && widget.departmentName.contains('Finance')) ||
        widget.departmentName.contains('Accounting') ||
        widget.departmentName.contains('HRM');
    
    // Check if this is an education faculty program
    final isEducationFaculty = widget.departmentName.contains('B.Ed');
    
    // Check if this is an arts faculty program
    final isArtsFaculty = widget.departmentName.contains('BA') ||
        widget.departmentName.contains('Theological') ||
        (widget.departmentName.contains('Development') && widget.departmentName.contains('Studies'));
    
    if (isScienceFaculty) {
      return scienceCourses;
    } else if (isBusinessFaculty) {
      return businessCourses;
    } else if (isEducationFaculty) {
      return educationCourses;
    } else if (isArtsFaculty) {
      return artsCourses;
    } else {
      return nursingCourses;
    }
  }

  final List<Map<String, String>> nursingCourses = [
    {
      'code': 'ACCRA 4',
      'name': 'PRINCIPLES AND METHODS OF TEACHING WITH ICT',
    },
    {
      'code': 'ACCRA 3',
      'name': 'MULTI-MEDIA COURSEWARE APPLICATION SYSTEM DEVELOPMENT',
    },
    {
      'code': 'ACCRA 3',
      'name': 'GAMIFICATION IN EDUCATION',
    },
    {
      'code': 'ACCRA 4',
      'name': 'RESEARCH AND TOOLS IN EDUCATION',
    },
    {
      'code': 'ACCRA 3',
      'name': 'DISTANCE AND COLLABORATIVE LEARNING',
    },
    {
      'code': 'ACCRA 3',
      'name': 'TECHNOLOGY INQUIRY-BASED CURRICULUM DEVELOPMENT',
    },
    {
      'code': 'ACCRA 4',
      'name': 'SENIOR INTERNSHIP PROJECT II',
    },
    {
      'code': 'ACCRA 8',
      'name': 'ANATOMY AND PHYSIOLOGY I',
    },
    {
      'code': 'ACCRA 4',
      'name': 'ANATOMY AND PHYSIOLOGY II',
    },
    {
      'code': 'ACCRA 5',
      'name': 'ANATOMY AND PHYSIOLOGY III',
    },
    {
      'code': 'ACCRA 5',
      'name': 'INTRODUCTION TO HUMAN ANATOMY AND PHYSIOLOGY',
    },
    {
      'code': 'ACCRA 5',
      'name': 'HUMAN ANATOMY AND PHYSIOLOGY I',
    },
    {
      'code': 'ACCRA 4',
      'name': 'BUSINESS FINANCE',
    },
    {
      'code': 'ACCRA 5',
      'name': 'ADVANCED FINANCIAL MANAGEMENT',
    },
    {
      'code': 'ACCRA 5',
      'name': 'FINANCIAL MARKETS AND INSTITUTIONS',
    },
    {
      'code': 'ACCRA 4',
      'name': 'ADVANCED CIRCUIT AND MARKETS RISK MANAGEMENT IN BANKS',
    },
    {
      'code': 'ACCRA 5',
      'name': 'MICROFINANCE AND RURAL DEVELOPMENT BANKING',
    },
    {
      'code': 'ACCRA 5',
      'name': 'BANK MANAGEMENT',
    },
    {
      'code': 'ACCRA 0',
      'name': 'COMMUNITY POLICING IN BANKING AND FINANCE',
    },
    {
      'code': 'ACCRA 5',
      'name': 'ELECTRONIC DEVICES AND CIRCUITS II',
    },
    {
      'code': 'ACCRA 5',
      'name': 'DIGITAL FUNDAMENTALS II',
    },
    {
      'code': 'ACCRA 7',
      'name': 'LANGUAGE AND COMMUNICATION FOR SKILLS I',
    },
    {
      'code': 'ACCRA 4',
      'name': 'LANGUAGE AND COMMUNICATION FOR SKILLS II',
    },
    {
      'code': 'ACCRA 1',
      'name': 'BIOMEDICAL COMPONENT TECHNOLOGY INTERNSHIP',
    },
    {
      'code': 'ACCRA 2',
      'name': 'BIOMEDICAL TECHNOLOGIES AND SENSORS',
    },
    {
      'code': 'ACCRA 4',
      'name': 'MEDICAL LABORATORY INSTRUMENTATION',
    },
    {
      'code': 'ACCRA 5',
      'name': 'MEDICAL IMAGING SYSTEMS I',
    },
    {
      'code': 'ACCRA 5',
      'name': 'ELECTRICAL CIRCUITS II',
    },
    {
      'code': 'ACCRA 4',
      'name': 'BIOMEDICAL EQUIPMENT MANAGEMENT',
    },
    {
      'code': 'ACCRA 5',
      'name': 'DIGITAL ELECTRONICS III',
    },
    {
      'code': 'ACCRA 5',
      'name': 'BIOMEDICAL COMPONENT TECHNOLOGY PROJECT',
    },
    {
      'code': 'ACCRA 4',
      'name': 'BIOMEDICAL INSTRUMENTATION II',
    },
    {
      'code': 'ACCRA 5',
      'name': 'INTRODUCTION TO ENGINEERING SOFTWARE',
    },
    {
      'code': 'ACCRA 1',
      'name': 'BIOMEDICAL ENGINEERING INTERNSHIP II',
    },
    {
      'code': 'ACCRA 7',
      'name': 'BIOMEDICAL HANDBOOKS AND STANDARDS',
    },
    {
      'code': 'ACCRA 2',
      'name': 'QUANTITATIVE HUMAN PHYSIOLOGY',
    },
    {
      'code': 'ACCRA 2',
      'name': 'TRANSPORT PHENOMENA IN BIOMEDICAL ENGINEERING',
    },
    {'code': 'ACCRA 3', 'name': 'FINANCIAL ACCOUNTING I'},
    {'code': 'ACCRA 4', 'name': 'FINANCIAL ACCOUNTING II'},
    {'code': 'ACCRA 4', 'name': 'INTRODUCTION TO ACCOUNTING'},
    {'code': 'ACCRA 3', 'name': 'FINANCIAL REPORTING I'},
    {'code': 'ACCRA 4', 'name': 'FINANCIAL REPORTING II'},
    {'code': 'ACCRA 7', 'name': 'AUDIT INC I'},
    {'code': 'ACCRA 5', 'name': 'COST AND MANAGERIAL ACCOUNTING II'},
    {'code': 'ACCRA 5', 'name': 'TAXATION II'},
    {'code': 'ACCRA 4', 'name': 'FINANCIAL MANAGEMENT II'},
    {'code': 'ACCRA 5', 'name': 'CORPORATE REPORTING II'},
    {'code': 'ACCRA 5', 'name': 'ASSIGNMENT IN ACCOUNTING'},
    {'code': 'ACCRA 4', 'name': 'MICROFINANCE IN RURAL BANKS IN ACCOUNTING'},
    {'code': 'ACCRA 5', 'name': 'ADVANCED FINANCIAL ACCOUNTING AND REPORTING'},
    {'code': 'ACCRA 5', 'name': 'ADVANCED ACCOUNTING AND REPORTING II'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED AUDIT AND ASSURANCE'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED TAXATION AND FISCAL POLICY'},
    {'code': 'ACCRA 5', 'name': 'PUBLIC SECTOR ACCOUNTING'},
    {'code': 'ACCRA 1', 'name': 'COMMUNITY POLICING IN ACCOUNTING'},
    {'code': 'ACCRA 1', 'name': 'INTRODUCTION TO AFRICAN MUSIC'},
    {'code': 'ACCRA 1', 'name': 'INTRODUCTION TO MUSIC'},
    {'code': 'ACCRA 1', 'name': 'CHOIR FANCY AND HYMNOGRAPHY'},
    {'code': 'ACCRA 3', 'name': 'WEB AND SOCIAL MEDIA MANAGEMENT TOOLS'},
    {'code': 'ACCRA 4', 'name': 'DECISION SUPPORT SYSTEMS'},
    {'code': 'ACCRA 4', 'name': 'INTRODUCTION TO E-BUSINESS INFORMATION SYSTEMS'},
    {'code': 'ACCRA 4', 'name': 'IT PROFESSIONAL ETHICS AND PRACTICE'},
    {'code': 'ACCRA 3', 'name': 'IT FOR BUSINESS IMAGE'},
    {'code': 'ACCRA 3', 'name': 'MEDIA RELATIONS'},
    {'code': 'ACCRA 4', 'name': 'COMMUNITY RELATIONS'},
    {'code': 'ACCRA 4', 'name': 'CONSUMER INSIGHT AND ACCOUNT PLANNING'},
    {'code': 'ACCRA 3', 'name': 'ADVERTISING MANAGEMENT'},
    {'code': 'ACCRA 2', 'name': 'INTRODUCTION TO COMPUTING'},
    {'code': 'ACCRA 3', 'name': 'IT APPLICATIONS IN BUSINESS'},
    {'code': 'ACCRA 1', 'name': 'INTRODUCTION TO COMPUTER SCIENCE'},
    {'code': 'ACCRA 3', 'name': 'FUNDAMENTALS OF COMPUTING SKILLS'},
    {'code': 'ACCRA 4', 'name': 'PRESENTATION PROGRAMMING'},
    {'code': 'ACCRA 5', 'name': 'DIGITAL ELECTRONICS'},
    {'code': 'ACCRA 2', 'name': 'INTRODUCTION TO SPREADSHEET'},
    {'code': 'ACCRA 7', 'name': 'DATABASE APPLICATIONS'},
    {'code': 'ACCRA 4', 'name': 'CIRCUIT COMPONENTS PROGRAMMING'},
    {'code': 'ACCRA 5', 'name': 'SYSTEMS PROGRAMMING'},
    {'code': 'ACCRA 5', 'name': 'COMPUTER ETHICS'},
    {'code': 'ACCRA 5', 'name': 'SYSTEMS ARCHITECTURE AND MICROPROCESSOR SYSTEMS'},
    {'code': 'ACCRA 5', 'name': 'DATA COMMUNICATIONS AND NETWORKS II'},
    {'code': 'ACCRA 4', 'name': 'FINANCIAL INFORMATION SYSTEMS'},
    {'code': 'ACCRA 3', 'name': 'COMPUTER SECURITY'},
    {'code': 'ACCRA 3', 'name': 'SOFTWARE ENGINEERING'},
    {'code': 'ACCRA 4', 'name': 'RESEARCH AND TOOLS'},
    {'code': 'ACCRA 3', 'name': 'OPERATION AND RESEARCH I'},
    {'code': 'ACCRA 2', 'name': 'COMPILER DESIGN I'},
    {'code': 'ACCRA 4', 'name': 'MOBILE APPLICATION DEVELOPMENT'},
    {'code': 'ACCRA 4', 'name': 'COMPUTING AND CYBERSECURITY'},
    {'code': 'ACCRA 4', 'name': 'COMPUTER VISION'},
    {'code': 'ACCRA 3', 'name': 'DATABASE SYSTEMS ADMINISTRATION'},
    {'code': 'ACCRA 5', 'name': 'ADVANCED SOFTWARE ENGINEERING'},
    {'code': 'ACCRA 4', 'name': 'PROGRAMMING LANGUAGE FOUNDATIONS'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED STORAGE AND ARCHITECTURE'},
    {'code': 'ACCRA 3', 'name': 'ADVANCED COMPUTER NETWORKING'},
    {'code': 'ACCRA 3', 'name': 'WIRELESS NETWORKS AND MOBILE COMPUTING'},
    {'code': 'ACCRA 4', 'name': 'COMPUTER SECURITY AND CRYPTOGRAPHY'},
    {'code': 'ACCRA 1', 'name': 'GRID AND CLOUD COMPUTING'},
    {'code': 'ACCRA 5', 'name': 'SOFTWARE REQUIREMENTS IN ENGINEERING'},
    {'code': 'ACCRA 5', 'name': 'SOFTWARE DESIGN AND SYSTEMS ARCHITECTURE'},
    {'code': 'ACCRA 4', 'name': 'EMBEDDED SYSTEMS DESIGN DEVELOPMENT AND TESTING'},
    {'code': 'ACCRA 4', 'name': 'SOFTWARE TESTING AND MAINTENANCE'},
    {'code': 'ACCRA 4', 'name': 'ARTIFICIAL INTELLIGENCE AND SUPPORT SYSTEMS'},
    {'code': 'ACCRA 4', 'name': 'MACHINE LEARNING'},
    {'code': 'ACCRA 5', 'name': 'BIG DATA MODELING AND VISUALIZATION'},
    {'code': 'ACCRA 4', 'name': 'IN-MARKET OR PROGRAMMING'},
    {'code': 'ACCRA 5', 'name': 'SYSTEMS ANALYSIS AND DESIGN'},
    {'code': 'ACCRA 5', 'name': 'COMPUTER NETWORKING AND DESIGN'},
    {'code': 'ACCRA 7', 'name': 'INDUSTRIAL INFORMATION SYSTEMS'},
    {'code': 'ACCRA 4', 'name': 'PROJECT WORK'},
    {'code': 'ACCRA 3', 'name': 'DEVELOPMENT HISTORY OF GHANA'},
    {'code': 'ACCRA 4', 'name': 'FINANCIAL MANAGEMENT AND BUDGETING'},
    {'code': 'ACCRA 3', 'name': 'COMMERCIAL LAW'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED BUSINESS TAXATION'},
    {'code': 'ACCRA 4', 'name': 'CORPORATE FINANCIAL REPORTING'},
    {'code': 'ACCRA 5', 'name': 'TOPICS IN ACCOUNTING AND FINANCIAL PRACTICES'},
    {'code': 'ACCRA 5', 'name': 'CONTRIBUTOR AND FINANCIAL STRATEGY'},
    {'code': 'ACCRA 4', 'name': 'FINANCIAL HUMAN RESOURCES'},
    {'code': 'ACCRA 5', 'name': 'INTERNATIONAL FINANCE'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED FINANCIAL DERIVATIVES'},
    {'code': 'ACCRA 4', 'name': 'QUANTITATIVE ANALYSIS RESEARCH METHODS'},
    {'code': 'ACCRA 5', 'name': 'ADVANCED STATISTICS'},
    {'code': 'ACCRA 4', 'name': 'INTERNATIONAL BUSINESS MANAGEMENT'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED CORPORATE GOVERNANCE AND ETHICS'},
    {'code': 'ACCRA 2', 'name': 'ADVANCED PUBLIC SECTOR SME'},
    {'code': 'ACCRA 2', 'name': 'ORGANIZATIONAL DEVELOPMENT AND CHANGE MANAGEMENT'},
    {'code': 'ACCRA 4', 'name': 'COMMUNITY MOBILIZATION AND ADVOCACY CHANGE'},
    {'code': 'ACCRA 4', 'name': 'CULTURAL ANTHROPOLOGY'},
    {'code': 'ACCRA 5', 'name': 'DEVELOPMENT HISTORY OF GHANA'},
  ];

  final List<Map<String, String>> scienceCourses = [
    {'code': 'ACCRA 3', 'name': 'RESEARCH METHODS'},
    {'code': 'ACCRA 1', 'name': 'BIOMEDICAL ENGINEERING INTERNSHIP II'},
    {'code': 'ACCRA 4', 'name': 'MEDICAL IMAGING II'},
    {'code': 'ACCRA 2', 'name': 'DIGITAL RADIOGRAPHY'},
    {'code': 'ACCRA 4', 'name': 'MEDICAL AND MEDICAL INFORMATICS'},
    {'code': 'ACCRA 7', 'name': 'BIO-ANALYSIS'},
    {'code': 'ACCRA 5', 'name': 'BIOMEDICAL ENGINEERING PROJECT'},
    {'code': 'ACCRA 5', 'name': 'BIOMEDICAL ENGINEERING PROJECT II'},
    {'code': 'ACCRA 4', 'name': 'BIOMEDICAL ENGINEERING'},
    {'code': 'ACCRA 5', 'name': 'COMPANY LAW'},
    {'code': 'ACCRA 5', 'name': 'BUSINESS ANALYTICS'},
    {'code': 'ACCRA 4', 'name': 'BIO-INDUSTRIAL MICROBIOLOGY'},
    {'code': 'ACCRA 5', 'name': 'ESSENTIALS OF BUSINESS'},
    {'code': 'ACCRA 5', 'name': 'BUSINESS COMMUNICATION'},
    {'code': 'ACCRA 4', 'name': 'QUALITATIVE RESEARCH IN BUSINESS OPERATIONS'},
    {'code': 'ACCRA 4', 'name': 'ENTREPRENEURSHIP SPACES - BUSINESS MANAGEMENT'},
    {'code': 'ACCRA 5', 'name': 'ECOMMERCE'},
    {'code': 'ACCRA 4', 'name': 'STRATEGIC MANAGEMENT'},
    {'code': 'ACCRA 4', 'name': 'BUSINESS PRACTICUM INTERNSHIP'},
    {'code': 'ACCRA 3', 'name': 'SENIOR RESEARCH PROJECT I'},
    {'code': 'ACCRA 3', 'name': 'SENIOR RESEARCH PROJECT II'},
    {'code': 'ACCRA 4', 'name': 'BUSINESS ECONOMICS'},
    {'code': 'ACCRA 3', 'name': 'MANAGEMENT AND ORGANIZATIONAL BEHAVIOR'},
    {'code': 'ACCRA 5', 'name': 'SEMINARS'},
    {'code': 'ACCRA 4', 'name': 'RESEARCH AND INQUIRY'},
    {'code': 'ACCRA 5', 'name': 'RESEARCH METHODOLOGIES'},
    {'code': 'ACCRA 3', 'name': 'PROJECT I'},
    {'code': 'ACCRA 4', 'name': 'INFORMATION II'},
    {'code': 'ACCRA 5', 'name': 'ORGANIC CHEMISTRY II'},
    {'code': 'ACCRA 5', 'name': 'CHEMISTRY FOR SALT SCIENCE'},
    {'code': 'ACCRA 5', 'name': 'CHEMISTRY FOR BIOMEDICAL ENGINEERING'},
    {'code': 'ACCRA 7', 'name': 'INTRODUCTION TO COMMUNICATION SKILLS'},
    {'code': 'ACCRA 2', 'name': 'INTRODUCTION TO COMMUNICATION SKILLS II'},
    {'code': 'ACCRA 2', 'name': 'INTRODUCTION TO COMMUNICATION SKILLS III'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED COMMUNICATION'},
    {'code': 'ACCRA 5', 'name': 'MASS COMMUNICATION'},
    {'code': 'ACCRA 5', 'name': 'FUNDAMENTALS OF JOURNALISM'},
    {'code': 'ACCRA 4', 'name': 'MICRO LECTURE II'},
    {'code': 'ACCRA 5', 'name': 'RESEARCH PAPERS'},
    {'code': 'ACCRA 3', 'name': 'CONTEMPORARY ISSUES IN DEVELOPMENT'},
    {'code': 'ACCRA 3', 'name': 'DEVELOPMENT FINANCING'},
    {'code': 'ACCRA 4', 'name': 'CURRICULUM DEVELOPMENT'},
    {'code': 'ACCRA 4', 'name': 'LABOUR AND DEVELOPMENT'},
    {'code': 'ACCRA 5', 'name': 'PRINCIPLES OF MICROECONOMICS'},
    {'code': 'ACCRA 3', 'name': 'PRINCIPLES OF MACROECONOMICS'},
    {'code': 'ACCRA 3', 'name': 'PERSONAL FINANCE'},
    {'code': 'ACCRA 5', 'name': 'HUMAN RESOURCE MANAGEMENT AND LEADERSHIP IN EDUCATION'},
    {'code': 'ACCRA 4', 'name': 'LEADERSHIP AND MANAGEMENT IN RELATION TO EDUCATION'},
    {'code': 'ACCRA 4', 'name': 'SUPERVISORY LEADERSHIP'},
    {'code': 'ACCRA 5', 'name': 'EDUCATIONAL POLICY ANALYSIS'},
    {'code': 'ACCRA 12', 'name': 'THESIS I'},
    {'code': 'ACCRA 17', 'name': 'THESIS II'},
    {'code': 'ACCRA 5', 'name': 'INTERNSHIP'},
    {'code': 'ACCRA 2', 'name': 'LEADERSHIP IN THE CURRICULUM'},
    {'code': 'ACCRA 4', 'name': 'INSTRUCTIONAL THEORIES'},
    {'code': 'ACCRA 5', 'name': 'CURRICULUM CHANGE AND EVALUATION'},
    {'code': 'ACCRA 5', 'name': 'INSTRUCTIONAL TECHNOLOGY'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED ASSESSMENT IN EDUCATION'},
    {'code': 'ACCRA 4', 'name': 'PERSONAL PROGRAMMING'},
    {'code': 'ACCRA 3', 'name': 'COMPUTER VISION'},
    {'code': 'ACCRA 3', 'name': 'COMPUTER ARCHITECTURE AND ORGANIZATION'},
    {'code': 'ACCRA 7', 'name': 'INTRODUCTION TO HOMESCHOOLING'},
    {'code': 'ACCRA 3', 'name': 'EDUCATIONAL COMPUTING'},
    {'code': 'ACCRA 3', 'name': 'MANAGING INFORMATION SYSTEMS'},
    {'code': 'ACCRA 4', 'name': 'MOBILE APPLICATION DEVELOPMENT'},
    {'code': 'ACCRA 3', 'name': 'ADVANCED DATABASE SYSTEM MANAGEMENT'},
    {'code': 'ACCRA 4', 'name': 'SYSTEMS AND NETWORKS ADMINISTRATION'},
    {'code': 'ACCRA 4', 'name': 'SCHOOL EDUCATION FOR TEACHING AND ADMINISTRATION'},
    {'code': 'ACCRA 9', 'name': 'METHODS OF TEACHING'},
    {'code': 'ACCRA 5', 'name': 'FOUNDATIONS OF EDUCATION'},
    {'code': 'ACCRA 7', 'name': 'PRINCIPLES OF GUIDANCE AND COUNSELING'},
    {'code': 'ACCRA 7', 'name': 'DEVELOPMENT OF EDUCATIONAL MATERIALS'},
    {'code': 'ACCRA 5', 'name': 'PRINCIPLES AND PRACTICES OF EDUCATION'},
    {'code': 'ACCRA 2', 'name': 'DEVELOPMENT OF INSTRUCTIONAL MATERIALS'},
    {'code': 'ACCRA 4', 'name': 'PSYCHOEDUCATIONAL CHILD DEVELOPMENT'},
    {'code': 'ACCRA 2', 'name': 'EDUCATIONAL MEASUREMENT AND EVALUATION'},
    {'code': 'ACCRA 5', 'name': 'ICT CURRICULUM TEACHING PRACTICE'},
    {'code': 'ACCRA 4', 'name': 'ADS SENIOR RESEARCH II'},
  ];

  final List<Map<String, String>> businessCourses = [
    {'code': 'ACCRA 3', 'name': 'BUSINESS ESSENTIALS'},
    {'code': 'ACCRA 3', 'name': 'COMPANY LAW'},
    {'code': 'ACCRA 3', 'name': 'BUSINESS ANALYTICS'},
    {'code': 'ACCRA 3', 'name': 'BUSINESS RESEARCH METHODS'},
    {'code': 'ACCRA 3', 'name': 'ESSENTIALS OF BUSINESS'},
    {'code': 'ACCRA 3', 'name': 'BUSINESS COMMUNICATION'},
    {'code': 'ACCRA 3', 'name': 'QUANTITATIVE METHODS FOR BUSINESS DECISIONS'},
    {'code': 'ACCRA 3', 'name': 'ENTREPRENEURSHIP AND SMALL BUSINESS MANAGEMENT'},
    {'code': 'ACCRA 3', 'name': 'ECOMMERCE'},
    {'code': 'ACCRA 3', 'name': 'STRATEGIC MANAGEMENT'},
    {'code': 'ACCRA 3', 'name': 'BUSINESS PRACTICUM (INTERNSHIP)'},
    {'code': 'ACCRA 3', 'name': 'SENIOR RESEARCH PROJECT I'},
    {'code': 'ACCRA 3', 'name': 'SENIOR RESEARCH PROJECT II'},
    {'code': 'ACCRA 3', 'name': 'BUSINESS ECONOMICS'},
    {'code': 'ACCRA 3', 'name': 'MANAGEMENT AND ORGANIZATIONAL BEHAVIOUR'},
    {'code': 'ACCRA 3', 'name': 'SEMINARS'},
    {'code': 'ACCRA 3', 'name': 'RESEARCH METHODS I'},
    {'code': 'ACCRA 3', 'name': 'RESEARCH METHODS II'},
    {'code': 'ACCRA 6', 'name': 'DISSERTATION I'},
    {'code': 'ACCRA 6', 'name': 'DISSERTATION II'},
    {'code': 'ACCRA 3', 'name': 'HUMAN RESOURCE MANAGEMENT'},
    {'code': 'ACCRA 3', 'name': 'COMPENSATION AND BENEFIT ADMINISTRATION'},
    {'code': 'ACCRA 3', 'name': 'INDUSTRIAL LAW'},
    {'code': 'ACCRA 3', 'name': 'LABOUR RELATIONS AND COLLECTIVE BARGAINING'},
    {'code': 'ACCRA 3', 'name': 'HUMAN RESOURCE INFORMATION SYSTEMS'},
    {'code': 'ACCRA 3', 'name': 'PUBLIC SECTOR HUMAN RESOURCE MANAGEMENT'},
    {'code': 'ACCRA 3', 'name': 'ORGANIZATIONAL BEHAVIOUR'},
    {'code': 'ACCRA 3', 'name': 'STRATEGIC HUMAN RESOURCE MANAGEMENT'},
    {'code': 'ACCRA 3', 'name': 'PERFORMANCE MANAGEMENT AND REWARDS'},
    {'code': 'ACCRA 3', 'name': 'GLOBAL HUMAN RESOURCE MANAGEMENT'},
    {'code': 'ACCRA 10', 'name': 'CONTEMPORARY ISSUES IN HUMAN RESOURCE MANAGEMENT'},
    {'code': 'BSAD521', 'name': 'BUSINESS ECONOMICS'},
    {'code': 'DRIM109', 'name': 'INTRODUCTION TO MICROECONOMICS'},
    {'code': 'DRIM110', 'name': 'INTRODUCTION TO MACROECONOMICS'},
    {'code': 'DCFI831', 'name': 'FINANCIAL ECONOMETRICS'},
    {'code': 'DVST276', 'name': 'ECONOMICS FOR DEVELOPMENT II'},
    {'code': 'ECON925', 'name': 'PRINCIPLES OF MICROECONOMICS'},
    {'code': 'ECON226', 'name': 'PRINCIPLES OF MACROECONOMICS'},
    {'code': 'EDAD570', 'name': 'ECONOMICS OF EDUCATION AND FINANCE'},
    {'code': 'ESST404', 'name': 'CONTEMPORARY ECONOMIC ISSUES'},
  ];

  final List<Map<String, String>> educationCourses = [
    {'code': 'HIRS260', 'name': 'WEBS AND SOCIAL MEDIA MANAGEMENT TOOLS'},
    {'code': 'DVST246', 'name': 'SOCIAL RESEARCH METHODS II'},
    {'code': 'DVST247', 'name': 'SOCIAL RESEARCH METHODS I'},
    {'code': 'ENGC330', 'name': 'SOCIOLINGUISTICS'},
    {'code': 'ESST297', 'name': 'SOCIAL ENVIRONMENT'},
    {'code': 'ESST234', 'name': 'METHODS OF TEACHING SOCIAL STUDIES'},
    {'code': 'ESST423', 'name': 'REFLECTIVE PRACTICE AND STRATEGIES IN SOCIAL STUDIES'},
    {'code': 'ESST464', 'name': 'ASSESSMENT IN SOCIAL STUDIES'},
    {'code': 'MFTIN', 'name': 'INFORMATION TECHNOLOGY AND SOCIETY'},
    {'code': 'RMHN252', 'name': 'INTRODUCTORY SOCIAL PSYCHOLOGY'},
    {'code': 'SOCI115', 'name': 'PRINCIPLES OF SOCIOLOGY'},
    {'code': 'SOCI149', 'name': 'INTRODUCTORY SOCIOLOGY'},
    {'code': 'ACCRA 4', 'name': 'SUPPORT IN TEACHING I'},
    {'code': 'ACCRA 4', 'name': 'SUPPORT IN TEACHING II'},
    {'code': 'ACCRA 3', 'name': 'EDUCATIONAL MANAGEMENT AND ADMINISTRATION'},
    {'code': 'ACCRA 3', 'name': 'EDUCATIONAL PSYCHOLOGY'},
    {'code': 'ACCRA 4', 'name': 'PHONETICS'},
    {'code': 'ACCRA 4', 'name': 'ADVANCED EDUCATIONAL STATISTICS'},
    {'code': 'ACCRA 5', 'name': 'INTRODUCTION TO LITERATURE'},
    {'code': 'ACCRA 4', 'name': 'SURVEY OF ENGLISH LITERATURE'},
    {'code': 'ACCRA 4', 'name': 'INTRODUCTION TO GRAMMAR'},
    {'code': 'ACCRA 2', 'name': 'LITERARY STYLISTICS'},
    {'code': 'ACCRA 4', 'name': 'PHONOLOGY'},
    {'code': 'ACCRA 4', 'name': 'MORPHOLOGY'},
    {'code': 'ACCRA 5', 'name': 'GERMAN LITERATURE'},
    {'code': 'ACCRA 4', 'name': 'PRACTICAL ICE'},
    {'code': 'ACCRA 4', 'name': 'HUMAN TIES OR ENGLISH'},
    {'code': 'ACCRA 5', 'name': 'MODERN ENGLISH STRUCTURE AND USAGE'},
    {'code': 'ACCRA 4', 'name': 'SHAKESPEARE: THE RENAISSANCE PERIOD'},
    {'code': 'ACCRA 5', 'name': 'METHODS OF TEACHING ENGLISH'},
    {'code': 'ACCRA 3', 'name': 'LITERARY CRITICISM'},
    {'code': 'ACCRA 4', 'name': 'ORAL LITERATURE'},
    {'code': 'ACCRA 4', 'name': 'ASSESSMENT IN ENGLISH LANGUAGE'},
    {'code': 'ACCRA 3', 'name': 'VICTORIAN LITERATURE'},
    {'code': 'ACCRA 7', 'name': 'LANGUAGE AND WRITING SKILLS'},
    {'code': 'ACCRA 7', 'name': 'LANGUAGE AND WRITING SKILLS II'},
    {'code': 'ACCRA 2', 'name': 'LANGUAGE AND WRITING SKILLS III'},
    {'code': 'ACCRA 4', 'name': 'METHODS OF TEACHING SCIENCE'},
    {'code': 'ACCRA 4', 'name': 'DEMOCRACY AND NATION BUILDING'},
    {'code': 'ACCRA 5', 'name': 'INTRODUCTION TO THE STUDY OF GHANAIAN HISTORY'},
    {'code': 'ACCRA 4', 'name': 'MARRIAGE AND FAMILY ISSUES'},
    {'code': 'ACCRA 5', 'name': 'CONFLICT AND PEACE STUDIES'},
    {'code': 'ACCRA 4', 'name': 'HERITAGE DEVELOPMENT AND ORGANIZATION'},
    {'code': 'ACCRA 5', 'name': 'METHODS OF TEACHING SOCIAL STUDIES'},
  ];

  final List<Map<String, String>> artsCourses = [
    {'code': 'RELB163', 'name': 'LIFE AND TEACHINGS OF JESUS'},
    {'code': 'RELB163', 'name': 'LIFE AND TEACHINGS OF JESUS'},
    {'code': 'RELB163', 'name': 'LIFE AND TEACHINGS OF JESUS'},
    {'code': 'RELB250', 'name': 'PRINCIPLES OF CHRISTIAN FAITH'},
    {'code': 'RELB250', 'name': 'PRINCIPLES OF CHRISTIAN FAITH'},
    {'code': 'RELB330', 'name': 'INTRODUCTION TO CHAPLAINCY'},
    {'code': 'ACCRA 3', 'name': 'LEADERSHIP AND MANAGEMENT'},
    {'code': 'ACCRA 3', 'name': 'INTRODUCTION TO LOGIC'},
    {'code': 'ACCRA 4', 'name': 'INTRODUCTION TO DISCOVERY OF RELIGION'},
    {'code': 'ACCRA 6', 'name': 'INTRODUCTION TO ANALYSIS'},
    {'code': 'ACCRA 2', 'name': 'ADVENT AND HERITAGE'},
    {'code': 'ACCRA 3', 'name': 'SCIENTIFIC STUDY OF DEVOTION'},
    {'code': 'ACCRA 3', 'name': 'BIRTH FAMILY AND MARRIAGE DYNAMICS'},
    {'code': 'ACCRA 3', 'name': 'BIBLICAL HERMENEUTICS'},
    {'code': 'ACCRA 3', 'name': 'EVANGELISM'},
    {'code': 'ACCRA 3', 'name': 'INTRODUCTION TO THEOLOGICAL STUDIES'},
    {'code': 'ACCRA 3', 'name': 'INTRODUCTION TO ISLAM'},
    {'code': 'ACCRA 2', 'name': 'MINISTRY PROJECTS AND COUNSELING'},
    {'code': 'ACCRA 3', 'name': 'PASTORAL MINISTRY'},
    {'code': 'ACCRA 3', 'name': 'INTRODUCTION TO SPECIALIZED KNOWLEDGE'},
    {'code': 'ACCRA 3', 'name': 'INTRODUCTION TO SPECIALIZED COUNSELING'},
    {'code': 'ACCRA 3', 'name': 'INTRODUCTION TO HOLISTIC EVANGELISM'},
    {'code': 'ACCRA 3', 'name': 'NEW TESTAMENT APOLOGETIC STUDIES'},
    {'code': 'ACCRA 3', 'name': 'SEMINAR IN MEDIEVAL AND AFRICAN CULTURE'},
    {'code': 'ACCRA 2', 'name': 'LATTER PAULINES AND CATHOLIC EPISTLES'},
    {'code': 'ACCRA 3', 'name': 'BIBLICAL RESEARCH PROJECT II'},
    {'code': 'ACCRA 3', 'name': 'COMPARATIVE HISTORY OF RELIGIONS'},
  ];

  void _toggleCourse(String courseKey) {
    setState(() {
      if (selectedCourses.contains(courseKey)) {
        selectedCourses.remove(courseKey);
      } else {
        if (selectedCourses.length < maxCourses) {
          selectedCourses.add(courseKey);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You can only select a maximum of 6 courses'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.departmentName} - Course Registration'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Header showing selection count
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: facultyColor.withOpacity(0.12),
              border: Border(
                bottom: BorderSide(
                  color: facultyColor,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Selected: ${selectedCourses.length}/$maxCourses courses',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: facultyColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: selectedCourses.length == maxCourses
                      ? () {
                          _showConfirmation();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: facultyColor,
                    disabledBackgroundColor: Colors.grey.shade400,
                  ),
                  child: const Text('Register'),
                )
              ],
            ),
          ),
          // Courses list
          Expanded(
            child: ListView.builder(
              itemCount: getCourses().length,
              itemBuilder: (context, index) {
                final course = getCourses()[index];
                final courseKey =
                    '${course['code']}_${course['name']}'; // Unique key
                final isSelected = selectedCourses.contains(courseKey);

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: GestureDetector(
                    onTap: () => _toggleCourse(courseKey),
                    child: Transform(
                      transform: Matrix4.identity()..setEntry(3, 2, 0.001),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isSelected
                                ? [
                                    facultyColor.withOpacity(0.2),
                                    facultyColor.withOpacity(0.05),
                                  ]
                                : [Colors.white, Colors.grey.shade50],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? facultyColor : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? facultyColor.withOpacity(0.25)
                                  : Colors.black.withOpacity(0.08),
                              offset: const Offset(0, 4),
                              blurRadius: isSelected ? 12 : 8,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.7),
                              offset: const Offset(-4, -4),
                              blurRadius: isSelected ? 8 : 4,
                              spreadRadius: isSelected ? 1 : 0,
                            ),
                          ],
                        ),
                        child: CheckboxListTile(
                          activeColor: facultyColor,
                          checkColor: Colors.white,
                          value: isSelected,
                          onChanged: (value) {
                            _toggleCourse(courseKey);
                          },
                          title: Text(
                            course['name']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  isSelected ? FontWeight.w600 : FontWeight.w500,
                              color: isSelected ? facultyColor : Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            'Code: ${course['code']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? facultyColor.withOpacity(0.7)
                                  : Colors.grey.shade600,
                              fontWeight:
                                  isSelected ? FontWeight.w500 : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.check_circle, color: facultyColor, size: 28),
            const SizedBox(width: 12),
            const Text('Confirm Registration'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: facultyColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'You are registering for ${selectedCourses.length} out of $maxCourses courses.',
                style: TextStyle(
                  fontSize: 14,
                  color: facultyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'This action is final and will be recorded in your academic profile.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Build the list of registered courses to display
              final registeredCoursesList = <Map<String, String>>[];
              for (String courseKey in selectedCourses) {
                final parts = courseKey.split('_');
                final code = parts[0];
                final name = parts.sublist(1).join('_');
                registeredCoursesList.add({
                  'code': code,
                  'name': name,
                });
              }

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => RegistrationConfirmationScreen(
                    departmentName: widget.departmentName,
                    registeredCourses: registeredCoursesList,
                    facultyColor: facultyColor,
                    studentID: generatedStudentID,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: facultyColor,
            ),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
