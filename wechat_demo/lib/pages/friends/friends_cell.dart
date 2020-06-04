import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

class FriendsCell extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets; // 展位图

  FriendsCell({this.imageUrl, this.name, this.groupTitle, this.imageAssets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: groupTitle != null ? 35 : 0,
          color: Color.fromRGBO(236, 237, 238, 1),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: groupTitle != null
              ? Text(
                  groupTitle,
                  style: TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(123, 127, 126, 1)),
                )
              : null,
        ),
        Container(
          height: 50,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: imageUrl != null
                            ? NetworkImage(imageUrl)
                            : AssetImage(imageAssets))),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: WeChatThemeColor,
          child: Row(
            children: [Container(width: 60, color: Colors.white)],
          ),
        )
      ],
    );
  }
}
