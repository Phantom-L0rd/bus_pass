import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_screen.dart';
import '../models/student.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _surnameCtrl = TextEditingController();
  final _initialsCtrl = TextEditingController();
  final _studentNoCtrl = TextEditingController();
  final _courseCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();
  final _resCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscure = true;

  static const _red = Color(0xFFE8402A);

  void _register() {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        studentNumber: _studentNoCtrl.text.trim(),
        surname: _surnameCtrl.text.trim(),
        initials: _initialsCtrl.text.trim(),
        course: _courseCtrl.text.trim(),
        year: _yearCtrl.text.trim(),
        residence: _resCtrl.text.trim(),
        date: '2024 / 2025',
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MainScreen(student: student)),
      );
    }
  }

  @override
  void dispose() {
    _surnameCtrl.dispose();
    _initialsCtrl.dispose();
    _studentNoCtrl.dispose();
    _courseCtrl.dispose();
    _yearCtrl.dispose();
    _resCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.black87, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create\naccount.',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Fill in your student details below.',
                  style: GoogleFonts.dmSans(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _field(
                        label: 'Surname',
                        controller: _surnameCtrl,
                        hint: 'e.g. Deng',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: _field(
                        label: 'Initials',
                        controller: _initialsCtrl,
                        hint: 'e.g. A.L.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _field(
                  label: 'Student Number',
                  controller: _studentNoCtrl,
                  hint: 'e.g. STU-2024-00142',
                ),
                const SizedBox(height: 16),
                _field(
                  label: 'Course',
                  controller: _courseCtrl,
                  hint: 'e.g. BSc Computer Science',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _field(
                        label: 'Year',
                        controller: _yearCtrl,
                        hint: 'e.g. 2nd Year',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _field(
                        label: 'Residence',
                        controller: _resCtrl,
                        hint: 'e.g. South Campus',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _field(
                  label: 'Password',
                  controller: _passwordCtrl,
                  hint: '••••••••',
                  obscure: _obscure,
                  suffix: IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black45,
                      size: 18,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  validator: (v) =>
                      v == null || v.length < 4 ? 'Min 4 characters' : null,
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _red,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    child: Text(
                      'Register & Get Pass',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field({
    required String label,
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    Widget? suffix,
    String? Function(String?)? validator,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: obscure,
            validator: validator ??
                (v) => v == null || v.isEmpty ? 'Required' : null,
            style: GoogleFonts.dmSans(fontSize: 14, color: Colors.black87),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  GoogleFonts.dmSans(color: Colors.black26, fontSize: 13),
              suffixIcon: suffix,
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              errorStyle: GoogleFonts.dmSans(fontSize: 10),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ],
      );
}
