import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
//import 'package:reclamation_uit/signup.dart';
import 'models/ModelProvider.dart'; // <- doit exister

import 'amplifyconfiguration.dart';
import 'signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(MyApp());
}

Future<void> _configureAmplify() async {
  try {
    final api = AmplifyAPI(
      options : APIPluginOptions(modelProvider:  ModelProvider.instance));
    await Amplify.addPlugins([
      api,
      AmplifyAuthCognito(),
    ]);

    await Amplify.configure(amplifyconfig);
  } catch (e) {
    safePrint("Amplify déjà configuré : $e");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connexion Étudiant',
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
