import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_template/shared/config/routes/routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> cities = ['طرابلس', 'بنغازي', 'مصراتة', 'سبها', 'درنة'];
    String? selectedCity;
    return Scaffold(
      backgroundColor: const Color(0xFFF7FFF0), // أخضر فاتح جدًا
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                'إنشاء حساب جديد',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFB2A900), // أصفر زيتوني مريح
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  labelText: 'الاسم الكامل',
                  prefixIcon: Icon(Icons.person, color: Color(0xFF7CB342)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: Icon(Icons.phone, color: Color(0xFF7CB342)),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'المدينة',
                  prefixIcon: Icon(Icons.location_city, color: Color(0xFF7CB342)),
                  border: OutlineInputBorder(),
                ),
                items: cities.map((city) => DropdownMenuItem(
                  value: city,
                  child: Text(city),
                )).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF7CB342)),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // TODO: تنفيذ التسجيل
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2FF59), // أخضر ليموني فاتح
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'تسجيل',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(AppRoute.login.toPath);
                },
                child: const Text(
                  'لديك حساب بالفعل؟ تسجيل الدخول',
                  style: TextStyle(fontSize: 16, color: Color(0xFFB2A900)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 