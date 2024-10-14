import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amina_enterprises_flutter_web/app/common_widgets/appbar/common_appbar.dart';
import 'package:amina_enterprises_flutter_web/app/modules/home/views/widget/content_place_widget.dart';
import 'package:amina_enterprises_flutter_web/app/modules/home/views/widget/sidemenu_view.dart';
import 'package:amina_enterprises_flutter_web/app/utils/responsive.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveWidget.isMobile(context)
          ? SizedBox(width: 250, child: SidemenuView(scaffoldKey: _scaffoldKey))
          : null,
      appBar: CommonAppBar(scaffoldKey: _scaffoldKey),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Flexible(
                flex: 2,
                child: SidemenuView(
                  scaffoldKey: _scaffoldKey,
                ),
              ),
            const Flexible(
              flex: 10,
              child: ContentPlaceWidget(),
            )
          ],
        ),
      ),
    );
  }
}
