/*
 * @Author: shh
 * @Date: 2020/5/30
 * @Last Modified by: shh
 * @Last Modified time: 2020/5/30
 * @Desc
 */
import 'package:flutter/material.dart';
import 'package:wechat_demo/styles/styles.dart';

import '../../styles/styles.dart';
import '../../styles/styles.dart';
import '../discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Widget _headerWidget() {
    return Container(
      color: Colors.white,
      height: 220,
      child: Container(
        margin: EdgeInsets.only(top: 100, bottom: 20),
        child: Row(
          children: <Widget>[
            /// 头像 left
            Container(
              height: 65,
              width: 65,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/Sang.png'), fit: BoxFit.cover)),
            ),

            /// 右侧信息
            Expanded(
              child: Container(
                height: 65,
                padding:
                    EdgeInsets.only(left: 20, top: 2, right: 10, bottom: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// 昵称
                    Expanded(
                      child: Text(
                        'Sang',
                        style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1)
                        ),
                      ),
                    ),

                    /// 微信号、扫码和箭头图片
                    Row(
                      children: <Widget>[
                        /// 微信号
                        Expanded(
                          child: Text(
                            '微信号:  shh230',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(128, 132, 133, 1)
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/ScanQRCode~iphone.png'),
                                width: 20,
                              ),
                              SizedBox(width: 10,),
                              Image(
                                image: AssetImage('images/icon_right.png'),
                                width: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WeChatThemeColor,
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                color: WeChatThemeColor,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: <Widget>[
                      _headerWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(
                        imageName: 'images/微信支付.png',
                        title: '支付',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(
                        imageName: 'images/微信收藏.png',
                        title: '收藏',
                      ),
                      DiscoverCell(
                        imageName: 'images/微信相册.png',
                        title: '相册',
                      ),
                      DiscoverCell(
                        imageName: 'images/微信卡包.png',
                        title: '卡包',
                      ),
                      DiscoverCell(
                        imageName: 'images/微信表情.png',
                        title: '表情',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DiscoverCell(
                        imageName: 'images/微信设置.png',
                        title: '设置',
                      ),
                    ],
                  ),
                )),
            Positioned(
              height: 25,
              top: 40,
              right: 20,
              child: Image.asset('images/相机.png'),
            )
          ],
        ));
  }
}
