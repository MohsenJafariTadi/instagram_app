import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xff1C1F2E),
              height: 70,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontSize: 20, fontFamily: 'GB'),
                indicatorWeight: 4,
                indicatorColor: Color(0xffF35383),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.followBack);
            },
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.likes);
            },
            childCount: 5,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This Week',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getRow(ActivityStatus.following);
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/item8.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Mohsen jafari',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3m',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(fontFamily: 'GB', fontSize: 16),
          ),
          onPressed: () {},
          child: Text('Follow'),
        );
      case ActivityStatus.likes:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item4.png'),
            ),
          ),
        );

      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: Color(0xffC5C5C5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey, width: 2),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: Color(0xffC5C5C5),
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey, width: 2),
          ),
        );
    }
  }
}
