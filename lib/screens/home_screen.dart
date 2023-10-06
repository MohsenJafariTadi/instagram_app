import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DraggableScrollableSheet(
                            initialChildSize: 0.4,
                            minChildSize: 0.2,
                            maxChildSize: 0.7,
                            builder: (context, controller) {
                              return ShareBottomSheet(
                                controller: controller,
                              );
                            }),
                      );
                    });
              },
              child: Text('Open BottomSheet'),
            ),
          ),
          SliverToBoxAdapter(
            child: _getStoryList(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    _getHeaderPost(),
                    SizedBox(
                      height: 24,
                    ),
                    _getPostContent(),
                  ],
                );
              },
              childCount: 4,
            ),
          )
        ],
      )),
    );
  }

  Widget _getStoryList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0 ? _getAddStoryBox() : _getStoryListBox();
          }),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 34,
              ),
              _getHeaderPost(),
              SizedBox(
                height: 24,
              ),
              _getPostContent(),
            ],
          );
        });
  }

  Widget _getPostContent() {
    return Container(
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('images/post.jpg'),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.5 K',
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                                fontFamily: 'GB',
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Image.asset('images/icon_share.png'),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohmmad',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'برنامه نویس موبایل',
                  style: TextStyle(color: Colors.white, fontFamily: 'SM'),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      strokeWidth: 2,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/profile.jpg'),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            strokeWidth: 2,
            dashPattern: [40, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset('images/profile.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'test',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'your story',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
