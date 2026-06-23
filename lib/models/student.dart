class Student {
  final String studentNumber;
  final String surname;
  final String initials;
  final String course;
  final String year;
  final String residence;
  final String date;
  final String? imagePath; // null = use avatar placeholder

  const Student({
    required this.studentNumber,
    required this.surname,
    required this.initials,
    required this.course,
    required this.year,
    required this.residence,
    required this.date,
    this.imagePath,
  });

  static const Student placeholder = Student(
    studentNumber: '202202143',
    surname: 'Kuol',
    initials: 'A.B.D.',
    course: 'BSc Physical Science',
    year: '3rd Year',
    residence: 'Arebeng 1',
    date: '2026',
    imagePath: 'assets/headshot.png',
  );
}
