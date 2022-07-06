import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:sohbet_uygulamasii/app/konusmalarim_page.dart';
import 'package:sohbet_uygulamasii/app/kullanicilar.dart';
import 'package:sohbet_uygulamasii/app/my_custom_bottom_navi.dart';
import 'package:sohbet_uygulamasii/app/profil.dart';
import 'package:sohbet_uygulamasii/app/tab_items.dart';
import 'package:sohbet_uygulamasii/model/user.dart';
import 'package:sohbet_uygulamasii/notification_handler.dart';
import 'package:sohbet_uygulamasii/viewmodel/all_users_view_model.dart';

class HomePage extends StatefulWidget {
  final MyUser user;

  HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  TabItem _currentTab = TabItem.Kullanicilar;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Kullanicilar: GlobalKey<NavigatorState>(),
    TabItem.Konusmalarim: GlobalKey<NavigatorState>(),
    TabItem.Profil: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> tumSayfalar() {
    return {
      TabItem.Kullanicilar: ChangeNotifierProvider(
        create: (context) => AllUserViewModel(),
        child: KullanicilarPage(),
      ),
      TabItem.Konusmalarim: KonusmalarimPage(),
      TabItem.Profil: ProfilPage(),
    };
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    NotificationHandler().initializeFCMNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[_currentTab].currentState.maybePop(),
      child: MyCustomBottomNavigation(
        sayfaOlusturucu: tumSayfalar(),
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
         

          if (secilenTab == _currentTab) {
            navigatorKeys[secilenTab].currentState.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              _currentTab = secilenTab;
            });
          }
        },
      ),
    );
  }
}
