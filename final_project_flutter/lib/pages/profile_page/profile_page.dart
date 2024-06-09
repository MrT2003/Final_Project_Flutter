import 'package:final_project_flutter/core/colors/color.dart';
import 'package:final_project_flutter/features/authetication/authentication_repository.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "This is profile",
          style: TextStyle(color: AppColor.blue),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => AuthenticationRepository.instance.logout(),
              label: Text('Sign Out'),
              icon: Icon(Icons.logout),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(0, 0),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
