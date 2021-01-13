import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';
import 'package:flutterstudy/res/resources.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片组件'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            ElementTitleView('加载网络图片'),
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg',height: 150,
              ),
            ),
            ElementTitleView('loadingBuilder--图片加载进度条'),
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                'https://upload-images.jianshu.io/upload_images/6243068-b78d4aea49710831.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240',height: 200,
                loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent loadingProgress){
                  if(loadingProgress == null){
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
            ),
            ElementTitleView('加载项目图片'),
            Container(
              color: HSLColors.bg_color,
              height: 400,
              padding: const EdgeInsets.all(20),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
//                    mainAxisSpacing: 10,
//                    childAspectRatio:9/10
                ),
                children: [
                  ImageFitItem(title: 'fill',itemFit: BoxFit.fill,),
                  ImageFitItem(title: 'contain',itemFit: BoxFit.contain,),
                  ImageFitItem(title: 'cover',itemFit: BoxFit.cover,),
                  ImageFitItem(title: 'fitWidth',itemFit: BoxFit.fitWidth,),
                  ImageFitItem(title: 'fitHeight',itemFit: BoxFit.fitHeight,),
                  ImageFitItem(title: 'none',itemFit: BoxFit.none,),
                  ImageFitItem(title: 'scaleDown',itemFit: BoxFit.scaleDown,),
                ],
              ),
            ),
            ElementTitleView('添加手机图片'),
            Container(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                child: Container(
                  width: 100,
                  height: 100,
                  child: _image == null
                      ? Icon(Icons.add)
                      : Image.file(_image),
                ),
                onTap: (){
                  getImage();
                },
              )
            ),
            ElementTitleView('加载GIF'),
            Container(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  'https://upload-images.jianshu.io/upload_images/6243068-f571578d9d5e178c.gif?imageMogr2/auto-orient/strip',height: 150,
                )
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFitItem extends StatelessWidget {
  const ImageFitItem({Key key,this.title,this.itemFit}):super(key:key);
  final String title;
  final BoxFit itemFit;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.deepOrange,
            child: Image.asset('assets/images/common/表情包.png',height: 80,width: 200,fit: itemFit,),
          ),
          Text('$title',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,)),
        ],
      )
    );
  }
}

