import 'package:amlak/shared/components/icon_with_text.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String mainImagePreview;
  final String realEstateName;
  final String realEstateSellingStatus;
  final String realEstateTitle;
  final String realEstatePrice;
  final String realEstateAddress;
  final String realEstateSize;
  final String realEstateBedrooms;
  final String realEstateBathrooms;
  final void Function()? onPressFavoriteButton;
  CardItem({
    required this.mainImagePreview,
    required this.realEstateName,
    required this.realEstateSellingStatus,
    required this.realEstateTitle,
    required this.realEstatePrice,
    required this.realEstateAddress,
    required this.realEstateSize,
    required this.realEstateBedrooms,
    required this.realEstateBathrooms,
    this.onPressFavoriteButton,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: SizedBox(
        width: width * 0.678,
        height: height * 0.57,
        child: Card(
          margin: EdgeInsetsDirectional.only(
            start: width * 0.09,
            end: width * 0.09,
            top: height * 0.05,
            bottom: height * 0.05,
          ),
          color: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.055),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // image and the favorite button
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.055),
                    ),
                    child: Image(
                      image: AssetImage(mainImagePreview),
                      fit: BoxFit.cover,
                      height: height * 0.16,
                      width: width * 0.5,
                    ),
                  ),
                  Opacity(
                    opacity: 0.55,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: width * 0.045,
                      child: IconButton(
                        onPressed: onPressFavoriteButton,
                        icon: Icon(
                          Icons.favorite_border,
                          size: width * 0.048,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.014,
              ),
              //The bar which contain the realEstateName and realEstateSelling type
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.033,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00ACEA),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width * 0.025),
                        bottomRight: Radius.circular(width * 0.025),
                      ),
                    ),
                    padding: EdgeInsetsDirectional.only(
                      start: width * 0.01,
                      end: width * 0.01,
                      top: height * 0.001,
                      bottom: height * 0.001,
                    ),
                    child: Text(
                      realEstateSellingStatus,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.04,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.28,
                  ),
                  Text(
                    realEstateName,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.038,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.0032,
                  ),
                  Container(
                    height: height * 0.033,
                    width: width * 0.02,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00ACEA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.025),
                        bottomLeft: Radius.circular(width * 0.025),
                      ),
                    ),
                    padding: EdgeInsetsDirectional.only(
                      start: width * 0.01,
                      end: width * 0.01,
                      top: height * 0.001,
                      bottom: height * 0.001,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: width * 0.025,
                  end: width * 0.025,
                  top: height * 0.015,
                  bottom: height * 0.022,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //Description of real estate
                    Text(
                      realEstateTitle,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF00ACEA),
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    //Price of real estate
                    Text(
                      realEstatePrice,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: width * 0.063,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    // location of real estate
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            realEstateAddress,
                            textDirection: TextDirection.rtl,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: width * 0.037),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.014,
                        ),
                        Image(
                          image: const AssetImage(
                            'assets/images/location.png',
                          ),
                          height: height * 0.0365,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.013,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconWithTextWidget(
                          imagePath: 'assets/images/bed.png',
                          number: realEstateBedrooms,
                        ),
                        IconWithTextWidget(
                          imagePath: 'assets/images/bath_icon.png',
                          number: realEstateBathrooms,
                        ),
                        IconWithTextWidget(
                          imagePath: 'assets/images/space.png',
                          number: realEstateSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// padding: EdgeInsetsDirectional.only(
// start: width * 0.164,
// end: width * 0.164,
// top: height * 0.1,
// bottom: height * 0.1,
