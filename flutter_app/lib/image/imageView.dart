import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片和Icon'),
      ),
      body: _buildView(),
    );
  }

  Widget _buildView() {
    return Column(
      children: <Widget>[
        Text('本地图片'),
        Image(
          image: AssetImage('lib/resource/avatar.png'),
          width: 50.0,
          height: 50.0,
        ),
        Divider(),
        Image.asset(
          'lib/resource/avatar.png',
          width: 50.0,
        ),
        Divider(),
        Text('网络图片'),
        Image(
          image: NetworkImage(
              'https://img.iplaysoft.com/wp-content/uploads/2019/free-images/free_stock_photo.jpg'),
          width: 100.0,
        ),
        Divider(),
        Image.network(
          'https://img.iplaysoft.com/wp-content/uploads/2019/free-images/free_stock_photo.jpg',
          width: 100.0,
        )
      ],
    );
  }
}
