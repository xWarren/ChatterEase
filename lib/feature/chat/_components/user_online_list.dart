
import 'package:chatter_ease/core/data/model/user_model.dart';

import '../../../core/resources/assets.dart';

List userOnlineList = const [
  UserModel(
    image: Assets.userImage19, 
    fullName: "Warren Virgines",
    isActiveNow: true,
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Jigglypuff",
    isActiveNow: true,
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Vinsmoke Sanji",
    isActiveNow: false,
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Monkey D Luffy",
    isActiveNow: true,
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Pikachu",
    isActiveNow: false,
  ),
  UserModel(
    image: Assets.userImage19,
    fullName: "Gengar",
    isActiveNow: false,
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Roronoa Zoro",
    isActiveNow: false,
  ),
];

List userMessageList = const [
   UserModel(
    image: Assets.userImage19, 
    fullName: "Warren Virgines",
    isActiveNow: true,
    message: "Lorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsum",
    time: "10:15pm",
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Jigglypuff",
    isActiveNow: true,
    message: "Lorem ",
    unreadMessage: 25,
    time: "10:15pm",
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Vinsmoke Sanji",
    isActiveNow: false,
    message: "Lorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsum",
    unreadMessage: 5,
    time: "10:15pm",
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Monkey D Luffy",
    isActiveNow: true,
    message: "Lorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsumLorem ipsum lorem ipsum",
    unreadMessage: 15,
    time: "10:15pm",
  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Pikachu",
    isActiveNow: false,
    message: "Lorem ipsum lorem ipsum.....",
    unreadMessage: 15,
    time: "10:15pm",
  ),
  UserModel(
    image: Assets.userImage19,
    fullName: "Gengar",
    isActiveNow: false,
    message: "Lorem ipsum lorem ipsum.....",
    unreadMessage: 5,
    time: "10:15pm",

  ),
  UserModel(
    image: Assets.userImage19, 
    fullName: "Roronoa Zoro",
    isActiveNow: false,
    message: "Lorem ipsum lorem ipsum.....",
    unreadMessage: 15,
    time: "10:15pm",
  ),
];