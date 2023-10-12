import 'dart:ui';
import 'package:fithouse_mobile/core/models/m_client.dart';
import 'package:fithouse_mobile/views/auth_screen.dart';
import 'package:fithouse_mobile/views/v_planning.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:fithouse_mobile/utilities/constant.dart';
import 'package:fithouse_mobile/views/homepage.dart';
import 'package:fithouse_mobile/views/v_acceuil.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../utilities/env.dart';

class DetailsCoursp extends StatefulWidget {
  final String nom;
  final String imageUrl;
  final String reglement;
  final String genre;
  final String desc;

  const DetailsCoursp({
    Key? key,
    required this.nom,
    required this.imageUrl,
    required this.reglement,
    required this.genre,
    required this.desc,
  }) : super(key: key);

  @override
  _DetailsCourspState createState() => _DetailsCourspState();
}

class _DetailsCourspState extends State<DetailsCoursp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              '${API.MEDIA_ENDPOINT}${widget.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          buttonArrow(context),
          scroll(),
        ],
      ),
    ));
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            clipBehavior: Clip.hardEdge,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black87),
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 1.0,
        minChildSize: 0.75,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: Colors.black12,
                          )
                        ],
                      ),
                    ),
                    Text(
                      widget.nom,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .merge(TextStyle(color: Colors.blueGrey)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            widget.genre == 'homme' || widget.genre == 'Homme'
                                ? Icon(
                                    Icons.man,
                                    color: Colors.blue,
                                  )
                                : widget.genre == 'femme' ||
                                        widget.genre == 'Femme'
                                    ? Icon(
                                        Icons.woman,
                                        color: Colors.pink,
                                      )
                                    : Row(
                                        children: [
                                          Icon(
                                            Icons.man,
                                            color: Colors.blue,
                                          ),
                                          Icon(
                                            Icons.woman,
                                            color: Colors.pink,
                                          ),
                                        ],
                                      ),
                            Text(widget.genre,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .merge(TextStyle(color: Colors.black)))
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    Text(
                      'Reglement',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.reglement),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.desc),
                  ]),
            ),
          );
        });
  }
}
