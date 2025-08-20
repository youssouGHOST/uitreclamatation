import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';

import 'models/ModelProvider.dart';
import 'provider/EtudiantProvider.dart';
import 'amplifyconfiguration.dart';
import 'signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EtudiantProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _configureAmplify() async {
  try {
    final api = AmplifyAPI(options: APIPluginOptions(modelProvider: ModelProvider.instance));
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connexion Étudiant',
      home: const SignInPage(),
      debugShowCheckedModeBanner: false,

      
    );
  }
}
