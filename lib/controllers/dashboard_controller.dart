import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job4all/models/categories_model.dart';

import '../utils/imageUtils.dart';

class DashboardController extends GetxController {
  var page;
  var sliderList = List<String>.empty(growable: true);
  var categoryList = List<CategoriesModel>.empty(growable: true);
  var popularList = List<PopularBiddersModel>.empty(growable: true);
  var recentList = List<RecentJobsModel>.empty(growable: true);
  var jobsMatchList = List<JobsMatchModel>.empty(growable: true);
  var isLoading = false.obs;

  @override
  void onInit() {
    page = Get.arguments;
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  Future getData() async {
    sliderList.clear();
    categoryList.clear();
    popularList.clear();
    recentList.clear();
    jobsMatchList.clear();
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1), () {
      sliderList.addAll([slider, slider, slider, slider, slider]);
      categoryList.addAll([
        CategoriesModel(title: "Handyman", image: category1),
        CategoriesModel(title: "Mechanic", image: category2),
        CategoriesModel(title: "Towing", image: category3),
        CategoriesModel(title: "Lawn", image: category4),
        CategoriesModel(title: "Baby Sitting", image: category5),
        CategoriesModel(title: "Pet Sitting", image: category6),
        CategoriesModel(title: "House Sitting", image: category7),
        CategoriesModel(title: "Food", image: category8)
      ]);
      popularList.addAll([
        PopularBiddersModel(
            name: "Lawrence Smith",
            image: popularBidder1,
            occupation: "Painter",
            rating: "4.5",
            color: Color(0xFF349E72)),
        PopularBiddersModel(
            name: "Stephan",
            image: popularBidder2,
            occupation: "Plumber",
            rating: "4.4",
            color: Color(0xFF9C9F0C)),
        PopularBiddersModel(
            name: "Kiran Kumar",
            image: popularBidder3,
            occupation: "Carpenter",
            rating: "4.1",
            color: Color(0xFF0A83C7)),
        PopularBiddersModel(
            name: "Simone Yard",
            image: popularBidder4,
            occupation: "Cleaner",
            rating: "4.3",
            color: Color(0xFFC96407))
      ]);
      recentList.addAll([
        RecentJobsModel(
            title: "Plumbing Work",
            subtitle: "Kitchen need to clean and change ...",
            image: recentJobs1,
            bids: "10 Bids",
            hours: "3 hours",
            amount: "'\$110",
            status: "Completed"),
        RecentJobsModel(
            title: "Home Cleaning",
            subtitle: "Kitchen need to clean and change ...",
            image: recentJobs2,
            bids: "10 Bids",
            hours: "3 hours",
            amount: "'\$230'",
            status: "Completed"),
        RecentJobsModel(
            title: "Painting Work",
            subtitle: "Kitchen need to clean and change ...",
            image: recentJobs3,
            bids: "10 Bids",
            hours: "3 hours",
            amount: "'\$98'",
            status: "Completed")
      ]);
      jobsMatchList.addAll([
        JobsMatchModel(
            title: "Water heater services",
            subtitle: "Lorem ipsum dolor sit amet, consectetur....",
            image: jobsMatch1,
            bids: "20 Bids",
            views: "90 views",
            favs: "35 favorites",
            status: "Place Pid"),
        JobsMatchModel(
            title: "Toilet plumbing",
            subtitle: "Lorem ipsum dolor sit amet, consectetur...",
            image: jobsMatch2,
            bids: "25 Bids",
            views: "40 views",
            favs: "15 favorites",
            status: "Place Pid"),
        JobsMatchModel(
            title: "Sump pump services",
            subtitle: "Lorem ipsum dolor sit amet, consectetur...",
            image: jobsMatch3,
            bids: "10 Bids",
            views: "20 views",
            favs: "32 favorites",
            status: "Place Pid"),
        JobsMatchModel(
            title: "Piping/leak services",
            subtitle: "Lorem ipsum dolor sit amet, consectetur...",
            image: jobsMatch4,
            bids: "45 Bids",
            views: "70 views",
            favs: "36 favorites",
            status: "Place Pid")
      ]);
      isLoading.value = false;
    });
    update();
  }
}
