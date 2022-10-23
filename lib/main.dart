import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF0A0E21,
            <int, Color>{
              50: Color(0xFFe9ecf8),
              100: Color(0xFFbec6eb),
              200: Color(0xFF929fde),
              300: Color(0xFF6779d1),
              400: Color(0xFF558B2F),
              500: Color(0xFF3b53c4),
              600: Color(0xFF2e4198),
              700: Color(0xFF212e6d),
              800: Color(0xFF141c41),
              900: Color(0xFF070916),
            },
          ),
          // accentColor: Colors.purple,
        ),
        // primarySwatch: const MaterialColor(
        //   0xFF0A0E21,
        //   <int, Color>{
        //     50: Color(0xFFe9ecf8),
        //     100: Color(0xFFbec6eb),
        //     200: Color(0xFF929fde),
        //     300: Color(0xFF6779d1),
        //     400: Color(0xFF558B2F),
        //     500: Color(0xFF3b53c4),
        //     600: Color(0xFF2e4198),
        //     700: Color(0xFF212e6d),
        //     800: Color(0xFF141c41),
        //     900: Color(0xFF070916),
        //   },
        // ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
