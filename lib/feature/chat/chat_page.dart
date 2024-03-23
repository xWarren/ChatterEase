import 'package:flutter/material.dart';


import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart';
import '_components/user_online_list.dart';
import 'search/search_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Chats",
                  style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const SearchPage(),
                      transitionDuration: const Duration(milliseconds: 100),
                      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                    )
                  );
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey.shade500)
                  )),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(Assets.icSearch),
                      const SizedBox(width: 5),
                      Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
          )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              itemCount: userOnlineList.length,
              itemBuilder: (context, index) {
                var data = userOnlineList[index];
                return Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    _buildUser(data),
                    _buildActive(data),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 4,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              itemCount: userMessageList.length,
              itemBuilder: (context, index) {
                var data = userMessageList[index];
                return Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.asset(
                              data.image,
                              height: 55,
                              width: 55,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              color: data.isActiveNow == true ? Colors.green : Colors.transparent,
                              shape: BoxShape.circle
                            ),
                            margin: const EdgeInsets.only(top: 40, left: 42),
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.fullName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: CustomColors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                data.unreadMessage.toString().isNotEmpty && data.unreadMessage != null
                                ? Container(
                                  height: 17,
                                  width: 17,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: CustomColors.fade,
                                    shape: BoxShape.circle
                                  ),
                                  child: Text(
                                     data.unreadMessage.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                )
                                : const SizedBox.shrink()
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.message,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: data.unreadMessage != null ? CustomColors.black : Colors.grey.shade400,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ),
                                Text(
                                  data.time,
                                  style: TextStyle(
                                    color: data.unreadMessage != null ? CustomColors.black : Colors.grey.shade400,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }, 
              separatorBuilder: (BuildContext context, int index) { 
                return Divider(
                  color: Colors.grey.shade300,
                  thickness: 0.5,
                );  
               },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActive(data) {
    return Container(
      height: 10,
      width: 10,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: data.isActiveNow == true ? Colors.green : Colors.transparent,
        shape: BoxShape.circle
      ),
      margin: const EdgeInsets.only(top: 33, left: 52),
    );
  }

  Widget _buildUser(data) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Image.asset(
              data.image,
              height: 45,
              width: 45,
            ),
          ),
          Expanded(
            child: Container(
              width: 55,
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                data.fullName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: CustomColors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}