import 'package:flutter/material.dart';
import 'package:uplisten/api/feed.dart';
import 'package:uplisten/components/bookItem.dart';
import 'package:uplisten/models/audiobook_short.dart';
import 'package:uplisten/models/feed.dart';

class ExploreList extends StatefulWidget {
  final Function navigate;
  final String url;

  ExploreList({required this.url, required this.navigate});

  @override
  _ExploreListState createState() => _ExploreListState();
}

class _ExploreListState extends State<ExploreList>
    with AutomaticKeepAliveClientMixin {
  List<AudiobookShort> feed = [];
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    fetch();

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        fetch();
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return feed.length != 0
        ? ListView.builder(
            itemCount: feed.length + 1,
            controller: controller,
            itemBuilder: (BuildContext ctx, int index) {
              if (index != feed.length) {
                return BookItem(
                  audioData: feed[index],
                  navigate: widget.navigate,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  fetch() async {
    try {
      AudiobookShortList list = await fetchFeed(widget.url);
      list.books.forEach((AudiobookShort book) => feed.add(book));
      setState(() {});
    } catch (error, stackTrace) {
      print(error);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
