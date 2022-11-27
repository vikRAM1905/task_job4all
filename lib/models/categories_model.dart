import 'package:flutter/material.dart';

class CategoriesModel {
  String? title;
  String? image;

  CategoriesModel({
    this.title,
    this.image,
  });
}

class PopularBiddersModel {
  String? name;
  String? image;
  String? occupation;
  String? rating;
  Color? color;
  PopularBiddersModel(
      {this.name, this.image, this.occupation, this.rating, this.color});
}

class RecentJobsModel {
  String? title;
  String? subtitle;
  String? image;
  String? bids;
  String? hours;
  String? amount;
  String? status;
  RecentJobsModel({
    this.title,
    this.subtitle,
    this.image,
    this.bids,
    this.hours,
    this.amount,
    this.status,
  });
}

class JobsMatchModel {
  String? title;
  String? subtitle;
  String? image;
  String? bids;
  String? views;
  String? favs;
  String? status;
  JobsMatchModel({
    this.title,
    this.subtitle,
    this.image,
    this.bids,
    this.views,
    this.favs,
    this.status,
  });
}
