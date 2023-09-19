import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uplisten/models/audiobook_short.dart';
import 'package:uplisten/screens/reader.dart';
import 'package:uplisten/state/playerState.dart';
import 'package:uplisten/utils/constants.dart';

class BookItem extends StatelessWidget {
  final AudiobookShort audioData;
  final Function navigate;

  BookItem({required this.audioData, required this.navigate});

  @override
  Widget build(BuildContext context) {
    final PlayerStore playerState = Provider.of<PlayerStore>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showModalBottomSheet(
          context: context,
          builder: (ctx) => Container(
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: "$apiurl/cover?name=${audioData.title}",
                          height: 70.0,
                          width: 70.0,
                          placeholder: (context, url) => Container(
                            width: 70.0,
                            height: 70.0,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: 70.0,
                            height: 70.0,
                            child: Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 128,
                            child: Text(
                              audioData.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Feather.play),
                  title: Text(
                    "Stream",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(ctx).pop();

                    if (playerState.id != int.parse(audioData.id)) {
                      playerState.play(int.parse(audioData.id));
                    }
                    navigate();
                  },
                ),

                // Code for Read Button

                // ListTile(
                //   leading: Icon(Feather.book),
                //   title: Text(
                //     "Read",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                //   onTap: () {
                //     Navigator.of(ctx).pop();
                //
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (c) => ReaderPage(
                //           name: audioData.title,
                //         ),
                //       ),
                //     );
                //   },
                // ),
                ListTile(
                  leading: Icon(Feather.x),
                  title: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print(audioData.id);
                    Navigator.of(ctx).pop();
                  },
                ),
                SizedBox(
                  height: Platform.isIOS ? 72 : 0,
                ),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 26.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: "$apiurl/cover?name=${audioData.title}",
                    height: 70.0,
                    width: 70.0,
                    placeholder: (context, url) => Container(
                      width: 70.0,
                      height: 70.0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      width: 70.0,
                      height: 70.0,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 70.0,
                  height: 70.0,
                  child: Center(
                    child: Icon(Icons.play_circle_outline),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 128,
                      child: Text(
                        audioData.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${audioData.numSections} sections - ${audioData.language}",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Length - ${audioData.totalTime}",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
