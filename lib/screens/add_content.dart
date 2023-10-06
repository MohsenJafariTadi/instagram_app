import 'package:flutter/material.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            Container(
              height: 83,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff272B40),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 10.0,right: 18,left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )));
  }

  Widget _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getContentHeader(),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          'images/item$index.png',
                        )),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 83),
        ),
      ],
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      height: 394,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              'images/item8.png',
            )),
      ),
    );
  }

  Widget _getContentHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Post',
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontFamily: 'GB'),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset('images/icon_arrow_down.png'),
          ],
        ),
        Row(
          children: [
            Text(
              'Next',
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'GB'),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset('images/icon_arrow_right_box.png')
          ],
        ),
      ],
    );
  }
}
