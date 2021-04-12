import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ImageRankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageRankPage(title: 'Image Rank'),
    );
  }
}
final List<String> imgList = [
  'images/logo.png',
  'images/logo2.png',
];

class ImageRankPage extends StatefulWidget {
  ImageRankPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ImageRankPageState createState() => _ImageRankPageState();
}
class _ImageRankPageState extends State<ImageRankPage> {
  static const List<double> initialRating = [0, 1]; // 평점

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Container(
            color: Color(0xFFEDF0F4),
            height: 400,
            child: PageView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    Swiper( // Swiper 구조
                        autoplay: false,
                        scale: 0.9,
                        viewportFraction: 0.8,
                        /*pagination: SwiperPagination(
                          alignment: Alignment.bottomRight,
                          ), 페이지 전체 개수가 나와서 제거함 */
                        itemCount: imgList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Image.asset(imgList[index]);
                        }
                      ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SmoothStarRating(
                        size: 40.0,
                        color: Colors.redAccent,
                        rating: initialRating[index],
                        onRated: (double value) {
                          debugPrint(
                              'Image no. $index was rated $value stars!!!');
                        },
                        borderColor: Colors.grey,
                        allowHalfRating: true,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      );
    }
}
/*
     @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
             height: 48.0,
            ),


            Container(
              color: Color(0xFFEDF0F4),
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Swiper( // Swiper 구조
                    autoplay: false,
                    scale: 0.9,
                    viewportFraction: 0.8,
                    /*pagination: SwiperPagination(
                    alignment: Alignment.bottomRight,
                    ), 페이지 전체 개수가 나와서 제거함 */
                    itemCount: imgList.length,
                    itemBuilder: (BuildContext context, int index){
                    return Image.asset(imgList[index]);
                    }
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SmoothStarRating(
                size: 40.0,
                color: Colors.yellow,
                rating: initialRating[index],
                onRated: (double value) {
                  debugPrint(
                      'Image no. $index was rated $value stars!!!');
                },
                borderColor: Colors.green,
                allowHalfRating: true,
              ),
            ),
          ],
        ),
    ); */