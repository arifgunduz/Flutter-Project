import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sohbet_uygulamasii/app/home_page.dart';
import 'package:sohbet_uygulamasii/app/sign_in/sign_in_page.dart';
import 'package:sohbet_uygulamasii/viewmodel/user_model.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: true);  
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return SignInPage();
      } else {
        return HomePage(user: _userModel.user);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
