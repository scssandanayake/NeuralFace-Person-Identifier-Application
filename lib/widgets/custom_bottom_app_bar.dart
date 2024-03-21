import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgNavHome,
        activeIcon: ImageConstant.imgNavHome,
        title: "Home",
        type: BottomBarEnum.Home,
        isSelected: true),
    /*BottomMenuModel(
      icon: ImageConstant.imgNavHistory,
      activeIcon: ImageConstant.imgNavHistory,
      title: "History",
      type: BottomBarEnum.History,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavTools,
      activeIcon: ImageConstant.imgNavTools,
      title: "Tools",
      type: BottomBarEnum.Tools,
    ),*/
    BottomMenuModel(
      icon: ImageConstant.imgNavUser,
      activeIcon: ImageConstant.imgNavUser,
      title: "User",
      type: BottomBarEnum.User,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: appTheme.whiteA700,
      child: SizedBox(
        height: 18.v,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomMenuList.length,
                (index) {
              return InkWell(
                onTap: () {
                  for (var element in bottomMenuList) {
                    element.isSelected = false;
                  }
                  bottomMenuList[index].isSelected = true;
                  widget.onChanged?.call(bottomMenuList[index].type);
                  setState(() {});
                },
                child: bottomMenuList[index].isSelected
                    ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      color: appTheme.teal600,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style:
                        CustomTextStyles.labelLargeTeal600.copyWith(
                          color: appTheme.teal600,
                        ),
                      ),
                    ),
                  ],
                )
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      color: appTheme.black900,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: appTheme.black900,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  History,
  Tools,
  User,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
