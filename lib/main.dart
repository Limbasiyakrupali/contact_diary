import 'package:contactdairy/provider/contact_provider.dart';
import 'package:contactdairy/provider/edit_data_provider.dart';
import 'package:contactdairy/provider/image_provider.dart';
import 'package:contactdairy/provider/stepper_provider.dart';
import 'package:contactdairy/screens/deatilpage.dart';
import 'package:contactdairy/screens/hide_contact_page.dart';
import 'package:contactdairy/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => StepperProvider()),
      ChangeNotifierProvider(create: (context) => ContactProvider()),
      ChangeNotifierProvider(create: (context) => imageProvider()),
      ChangeNotifierProvider(create: (context) => editdataProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const homepage(),
        "detailpage": (context) => const contactinfo(),
        "hidecontact": (context) => const hidecontactpage(),
      },
    );
  }
}
