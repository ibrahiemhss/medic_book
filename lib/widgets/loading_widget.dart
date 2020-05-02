import 'package:flutter/cupertino.dart';
import 'package:medic_book/helpers/constants.dart';

class CardLoading extends StatelessWidget {
  final String imageUrl;
  final double width;
  final String title;

// Construction method
  CardLoading({@required this.title,@required this.width, @required this.imageUrl})
      : assert(title != null),
        assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??100,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.0))),
      margin: EdgeInsets.only(right: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/image_none.gif',
                image: 'assets/images/image_none.gif',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(this.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
              TextStyle(fontSize: 14.0, color: Color(AppColors.fontColor)))
        ],
      ),
    );
  }
}