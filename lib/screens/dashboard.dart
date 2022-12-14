import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job4all/controllers/dashboard_controller.dart';
import 'package:job4all/utils/colorUtils.dart';
import 'package:job4all/utils/imageUtils.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dahboardController = Get.put(DashboardController());
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.10),
          child: Column(
            children: [
              const Spacer(),
              AppBar(
                title: const Text(""),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        size: 30,
                        Icons.notifications,
                        color: Colors.black,
                      )),
                  InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/Vector.png",
                        height: 35,
                        width: 35,
                      )),
                ],
                elevation: 0,
                backgroundColor: secondaryColor,
              ),
            ],
          )),
      body: GetBuilder<DashboardController>(
          builder: (controller) => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                ))
              : controller.page == 1
                  ? SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: primaryColor.withOpacity(0.02),
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                sliderWidget(controller, size),
                                pageIndicator(size, controller)
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "All Categories",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: size.height * 0.27,
                              width: double.infinity,
                              child: GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 10,
                                crossAxisCount: 4,
                                children: [
                                  for (int i = 0;
                                      i < controller.categoryList.length;
                                      i++)
                                    Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Image.asset(
                                          controller.categoryList[i].image!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(controller.categoryList[i].title!,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16))
                                    ])
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Popular Bidder",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: size.height * 0.18,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < controller.popularList.length;
                                      i++)
                                    popular(controller.popularList[i], size)
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Recent Jobs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return recentJobs(controller, index, size);
                                }),
                                itemCount: controller.recentList.length,
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        )),
                      ),
                    )
                  : SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: primaryColor.withOpacity(0.02),
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                sliderWidget_2(controller, size),
                                pageIndicator_2(size, controller)
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text(
                                  "Jobs match with you",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 22),
                                ),
                                const Spacer(),
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue),
                                  child: Center(
                                    child: Text("View all jobs",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: secondaryColor)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return jobMatchWidget(controller, index, size);
                              }),
                              itemCount: controller.jobsMatchList.length,
                            )
                          ],
                        )),
                      ),
                    )),
    );
  }

  Padding jobMatchWidget(DashboardController controller, int index, size) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          height: size.height * 0.10,
          width: size.width * 0.98,
          child: Row(
            children: [
              Image.asset(controller.jobsMatchList[index].image!,
                  height: size.height * 0.08,
                  width: size.width * 0.18,
                  fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.7,
                      child: Row(
                        children: [
                          Text(controller.jobsMatchList[index].title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const Spacer(),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                  controller.jobsMatchList[index].status!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: secondaryColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(controller.jobsMatchList[index].subtitle!),
                    SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(bidIcon, height: 20, width: 20),
                          Text(controller.jobsMatchList[index].bids!),
                          const SizedBox(width: 10),
                          Image.asset(viewIcon, height: 20, width: 20),
                          Text(controller.jobsMatchList[index].views!),
                          const SizedBox(width: 10),
                          Image.asset(favIcon, height: 20, width: 20),
                          Text(controller.jobsMatchList[index].favs!),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Positioned pageIndicator_2(Size size, DashboardController controller) {
    return Positioned(
      bottom: size.height * 0.007,
      left: size.width * 0.4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: size.width * 0.2,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  controller.sliderList.length,
                  (index) => Container(
                        height: size.height / 168.8,
                        width: size.width / 78,
                        margin: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 3, right: 3),
                        decoration: BoxDecoration(
                            color: carouselIndex == index
                                ? primaryColor
                                : const Color(0xFFD4D4D4),
                            shape: BoxShape.circle),
                      )),
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider sliderWidget_2(DashboardController controller, Size size) {
    return CarouselSlider(
      options: CarouselOptions(
          onPageChanged: ((index, reason) => {
                setState(() => {carouselIndex = index})
              }),
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          height: size.height * 0.2,
          viewportFraction: 1),
      items: controller.sliderList
          .map((item) => Center(
              child: Image.asset(item,
                  fit: BoxFit.cover, width: size.width * 0.9)))
          .toList(),
    );
  }

  Positioned pageIndicator(Size size, DashboardController controller) {
    return Positioned(
      bottom: size.height * 0.007,
      left: size.width * 0.4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: size.width * 0.2,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  controller.sliderList.length,
                  (index) => Container(
                        height: size.height / 168.8,
                        width: size.width / 78,
                        margin: const EdgeInsets.only(
                            top: 3, bottom: 3, left: 3, right: 3),
                        decoration: BoxDecoration(
                            color: carouselIndex == index
                                ? primaryColor
                                : const Color(0xFFD4D4D4),
                            shape: BoxShape.circle),
                      )),
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider sliderWidget(DashboardController controller, Size size) {
    return CarouselSlider(
      options: CarouselOptions(
          onPageChanged: ((index, reason) => {
                setState(() => {carouselIndex = index})
              }),
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          height: size.height * 0.2,
          viewportFraction: 1),
      items: controller.sliderList
          .map((item) => Center(
              child: Image.asset(item,
                  fit: BoxFit.cover, width: size.width * 0.9)))
          .toList(),
    );
  }

  Padding recentJobs(DashboardController controller, int index, size) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          height: size.height * 0.10,
          width: size.width * 0.98,
          child: Row(
            children: [
              Image.asset(controller.recentList[index].image!,
                  height: size.height * 0.08,
                  width: size.width * 0.18,
                  fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.7,
                      child: Row(
                        children: [
                          Text(controller.recentList[index].title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          const Spacer(),
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue),
                            child: Center(
                              child: Text(controller.recentList[index].status!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: secondaryColor)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(controller.recentList[index].subtitle!),
                    SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(bidIcon, height: 20, width: 20),
                          Text(controller.recentList[index].bids!),
                          const SizedBox(width: 10),
                          Image.asset(timerIcon, height: 20, width: 20),
                          Text(controller.recentList[index].hours!),
                          const SizedBox(width: 10),
                          Image.asset(dollorIcon, height: 20, width: 20),
                          Text(controller.recentList[index].amount!),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget popular(model, Size size) {
    return Stack(
      children: [
        Positioned(
            top: size.height * 0.01,
            right: 0,
            child: SizedBox(
                height: size.height * 0.03,
                width: size.width * 0.08,
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(model.rating!, style: TextStyle(fontSize: 12)),
                  ],
                ))),
        SizedBox(
          height: size.height * 0.2,
          width: size.height * 0.11,
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: size.height * 0.1,
                width: size.width * 0.22,
                decoration: BoxDecoration(
                    color: model.color, borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      model.name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(model.occupation!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        )),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: size.width * 0.035,
          top: size.height * 0.03,
          child: SizedBox(
            height: size.height * 0.1,
            width: size.height * 0.08,
            child: Image.asset(model.image!),
          ),
        ),
      ],
    );
  }
}
