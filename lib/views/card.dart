import 'package:flutter/cupertino.dart';
import 'package:apod_app/models/ApodImage.dart';

class CupertinoCard extends StatelessWidget {
  const CupertinoCard({
    Key key,
    @required this.apodImage,
    @required this.onPressed,
    this.icon
  }) : super(key: key);
  final ApodImage apodImage;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    if(apodImage.mediaType == 'video') return Container();
    var imgPlaceHolder =
        new AssetImage('assets/cupertino_activity_indicator.gif');
    var imgNet = new NetworkImage(apodImage.url);
    final _card = Stack(
      alignment: Alignment.bottomCenter, 
      children: <Widget>[
        FadeInImage(
          placeholder: imgPlaceHolder,
          image: imgNet,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 200),
        ),
        Opacity(
          opacity: .7,
          child: Container(
            width: double.infinity,
            height: 90,
            color: CupertinoColors.black,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(apodImage.date, style: TextStyle(color: CupertinoColors.white),),
                Flexible(child: Text(apodImage.title, style: TextStyle(color: CupertinoColors.white, fontSize: 20),)),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5, right: 5,
          child: CupertinoButton(child: Icon(icon, color: CupertinoColors.white, size: 30,), 
            onPressed: onPressed
          ),
        ),
      ]
    );

    return Container(
      //height: 150,
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: 
        BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: CupertinoColors.systemGrey.withOpacity(.9),
                offset: Offset(5, 5),
                blurRadius: 8),
            BoxShadow(
                color: CupertinoColors.systemGrey.withOpacity(1),
                offset: Offset(3, 3),
                blurRadius: 8)
          ]
        ),
      child: ClipRRect(borderRadius: BorderRadius.circular(15), child: _card),
    );
  }
}
