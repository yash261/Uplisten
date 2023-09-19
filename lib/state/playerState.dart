import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uplisten/api/book.dart';
import 'package:uplisten/models/audiobook_full.dart';
import 'package:uplisten/utils/color.dart';
part 'playerState.g.dart';

class PlayerStore = _PlayerStore with _$PlayerStore;

abstract class _PlayerStore with Store {
  @observable
  int id = 0;

  @observable
  int idx = 0;

  @observable
  AudiobookFull? book;

  @observable
  bool loading = false;

  @observable
  Color bgColor = Color(0xFF0e153a);

  @observable
  Color accentColor = Color(0xFF22d1ee);

  @observable
  int seekTime = 5;

  @action
  Future<void> persistColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        "bgColor",
        "#" +
            bgColor
                .toString()
                .replaceAll(new RegExp(".*0xff"), "")
                .replaceAll(")", ""));
    await prefs.setString(
        "accentColor",
        "#" +
            accentColor
                .toString()
                .replaceAll(new RegExp(".*0xff"), "")
                .replaceAll(")", ""));
  }

  @action
  void loadColors() {
    SharedPreferences.getInstance().then((prefs) {
      bgColor = HexColor(prefs.getString("bgColor")??"#000120");
      accentColor = HexColor(prefs.getString("accentColor")??"#ff6b80");
    });
  }

  @action
  Future<void> play(int i) async {
    id = i;
    loading = true;
    book = await fetchBook(i);
    loading = false;
  }

  @action
  Future<void> persistSeekTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt("seekTime", seekTime);
  }

  @action
  void loadSeekTime() {
    SharedPreferences.getInstance().then((prefs) {
      seekTime = prefs.getInt("seekTime") ?? 5;
    });
  }
}
