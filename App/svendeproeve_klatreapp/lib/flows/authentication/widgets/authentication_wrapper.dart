import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:svendeproeve_klatreapp/flows/app_nav_bar/app_nav_bar.dart';
import 'package:svendeproeve_klatreapp/flows/authentication/authentication_page.dart';
<<<<<<< HEAD
import 'package:svendeproeve_klatreapp/flows/moderator/overview/moderator_overview_page.dart';
import 'package:svendeproeve_klatreapp/global/constants.dart';
=======
import 'package:svendeproeve_klatreapp/flows/authentication/widgets/loading.dart';
>>>>>>> master
import 'package:svendeproeve_klatreapp/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

<<<<<<< HEAD
  Future<void> GetAPIToken(storage, userUID) async {
    String secret = await storage.read(key: 'Secret');
    secret = Uri.encodeComponent(secret)
        .replaceAll('*', '%2A')
        .replaceAll('!', '%21')
        .replaceAll('25', '');

    var uri = 'https://10.0.2.2:7239/Login/$secret&$userUID';
    print(secret);
    print(userUID);
    var request = await http.get(Uri.parse(uri));
    print(request.body);

    if (request.statusCode == 200) {
      print('Token fetched');
      await storage.write(key: 'Token', value: request.body);
    }
  }

  Future<void> getFirebaseSecret() async {
    const storage = FlutterSecureStorage();
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    String? value = await storage.read(key: 'Secret');
    if (value == null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _db
          .collection('Login Verification')
          .doc('PBTElOYPubm6W28jj5jT')
          .get();

      await storage.write(key: 'Secret', value: snapshot.data()?['Secret']);
    }

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (await storage.read(key: 'Secret') != null) {
      GetAPIToken(storage, user!.uid);
    }
  }

=======
>>>>>>> master
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass?>(context);
    // Return either home or authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
<<<<<<< HEAD
      getFirebaseSecret();
      apiService.getAllClimbingCenters();
      return isModerator ? const ModOverviewPage() : const NavBarPage();
=======
      return const LoadingWidget();
>>>>>>> master
    }
  }
}
