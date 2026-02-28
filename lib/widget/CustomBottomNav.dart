import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import '../home.dart';

import '../profil.dart';

import '../demande.dart';

import '../signin.dart';

class CustomBottomNav extends StatefulWidget {

const CustomBottomNav({super.key});

@override

State<CustomBottomNav> createState() => _CustomBottomNavState();

}

class _CustomBottomNavState extends State<CustomBottomNav> {

int _selectedIndex = 0;

// Couleurs du thème moderne

static const Color primaryBlue = Color(0xFF2563EB);

Future<void> signOut(BuildContext context) async {

try {
  final result = await Amplify.Auth.signOut();
  if (result is CognitoCompleteSignOut) {
    safePrint("✅ Déconnexion réussie");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  } else if (result is CognitoFailedSignOut) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("⚠️ Erreur de déconnexion")),
    );
  }
} catch (e) {
  safePrint("❌ Erreur lors de la déconnexion : $e");
}
}

void _onItemTapped(int index) async {

setState(() => _selectedIndex = index);
switch (index) {
  case 0:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomePage() ),
    );
    break;
  case 1:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Profil()),
    );
    break;
  case 2:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Demande()),
    );
    break;
  case 3:
    await signOut(context);
    break;
}
}

@override

Widget build(BuildContext context) {

return Container(
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, -2),
      ),
    ],
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
  ),
  child: ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(24),
      topRight: Radius.circular(24),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent,
      selectedItemColor: primaryBlue,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      items: const [
         BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "Profil",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          activeIcon: Icon(Icons.list_alt_rounded),
          label: "Demandes",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          activeIcon: Icon(Icons.logout),
          label: "Déconnexion",
        ),
      ],
    ),
  ),
);
}

}