import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';
import 'screens/home/screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {}
  Stripe.publishableKey =
      'pk_test_51NjHAUCBxEywMsKlY5fcXyEgN7J4X4iVK1G6szVOCNyXfmSleoWkDfc76VxGL1og4MSTupREDChMkeGw4mvrqfEl00IgDh7ka5';

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgscaffold,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      //  ThemeData(
      //   textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomeScreen(),
    );
  }
}
