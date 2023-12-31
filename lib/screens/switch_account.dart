import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccount extends StatelessWidget {
  const SwitchAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/switch_account_background.png'),
                  ),
                ),
              ),
              Positioned(
                top: 250,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      width: 340,
                      height: 352,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2),
                              ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Image(
                            image: AssetImage('images/profile.png'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Mohsen Jafari',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 46,
                            width: 129,
                            child: ElevatedButton(
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              onPressed: () {},
                              child: Text('Confirm'),
                            ),
                          ),
                          Text(
                            'switch account',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
           Padding(
            padding: EdgeInsets.only(
              top: 132,
              bottom: 63,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account? / ',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.grey.shade700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sing up',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
