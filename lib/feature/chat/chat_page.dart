import 'package:flutter/material.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart';
import '_components/user_online_list.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade500)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade500)
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                    prefixIcon: Image.asset(
                      Assets.icSearch
                    )
                  ),
                ),
              )
            ],
          )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
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
          )
        ],
      ),
    );
  }

  Widget _buildActive(data) {
    return Container(
      height: 7,
      width: 7,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: data.isActiveNow == true ? Colors.green : Colors.transparent,
        shape: BoxShape.circle
      ),
      margin: const EdgeInsets.only(top: 30, left: 43),
    );
  }

  Widget _buildUser(data) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 20,
            child: Image.asset(
              data.image,
              height: 55,
              width: 55,
            ),
          ),
          Container(
            width: 55,
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
          )
        ],
      ),
    );
  }
}