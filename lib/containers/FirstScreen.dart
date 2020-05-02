import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medic_book/widgets/FirstScreen/FirstScreenContent.dart';
import 'package:medic_book/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:medic_book/stores/homeStore.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/widgets/common/MyHeader.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}
class _FirstScreenState extends State<FirstScreen>
    with AutomaticKeepAliveClientMixin {
  HomeStore homeStore;
  EasyRefreshController _controller;
  bool _signedIn=false;
  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Pull down to refresh
    _controller = EasyRefreshController();
    // get first enter values

        homeStore = Provider.of<HomeStore>(this.context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
        builder: (_) {
      _signedIn = homeStore.logedIn??false;
      _loading=false;
      print("get entrance data values  is :\n"
          " signedIn=${_signedIn.toString()}");
      return
        EasyRefresh(
        enableControlFinishRefresh: false,
        bottomBouncing: Theme.of(context).platform == TargetPlatform.iOS,
        header: MyHeader(
            refreshedText: "update completed",
            refreshFailedText: "Refresh failed, please try again later",
            refreshReadyText: "Let go",
            refreshingText: "Updating content",
            refreshText: "Pull down to refresh",
            textColor: Color(AppColors.themeColor),
            showInfo: false),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: Constants.pageMarginSide,
                  right: Constants.pageMarginSide,
                  top: 20.0,
                  bottom: 40),
              child:
              _loading?
              CardLoading(title: "loading", width: null,):
              FirstScreenContent(signedIn: _signedIn??false,),
            ),
          ],
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            // _controller.resetLoadState();
            _controller.finishRefresh(success: true);
          });
        },
      );},
    );
  }

  @override
  bool get wantKeepAlive => true;
}
