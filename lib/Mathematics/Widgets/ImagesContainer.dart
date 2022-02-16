import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Images Displaying Column/Row: Columns/Rows that display the number of images in it.
class ImagesContainer extends StatelessWidget {
  final double height;
  final double width;
  final String image;
  final bool isColumn;
  final int end;
  const ImagesContainer({
    Key key,
    this.height,
    this.width,
    this.image,
    this.isColumn,
    this.end,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey, width: 5),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: isColumn ? getColumn() : getRow(),
    );
  }

  Column getColumn() {
    List<Widget> imageList = [];
    Container imagecontainer = Container(
      height: height / 6,
      width: width,
      child: Image(
        image: AssetImage(
          image,
        ),
        //fit: BoxFit.contain,
      ),
    );

    for (int i = 0; i < end; i++) {
      imageList.add(imagecontainer);
    }
    final Column columnStar = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imageList,
    );
    return columnStar;
  }

  Row getRow() {
    List<Widget> imageList = [];
    Container imagecontainer = Container(
      height: height,
      width: width / 11,
      child: Image(
        image: AssetImage(
          image,
        ),
        //fit: BoxFit.fill,
      ),
    );
    for (int i = 0; i < end; i++) {
      imageList.add(imagecontainer);
    }
    final Row rowStar = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imageList,
    );
    return rowStar;
  }
}
