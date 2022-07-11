import 'package:coorgle_test_project/product/product_data.dart';
import 'package:coorgle_test_project/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';



class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DetailScreen> {

  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = false;
  int rotationCount = 22;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  bool imagePrecached = true;

  @override
  void initState() {
    super.initState();
    updateImageList(context);
  }

  void updateImageList(BuildContext context) {
    for (int i = 1; i <= 21; i++) {
      imageList.add(AssetImage('assets/s$i.png'));
    }
  }

  List<Widget> buildColorWidgets() {
    return Product.products
        .map(
          (e) => Container(
        padding: const EdgeInsets.only(left: 5, bottom: 10,top: 15),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: e.id == 1 ? MyColors.myOrange : Colors.white),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                e.image,
                height: 30,
                width: 30,
              ),
            ),),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text("Men's Shoes", style: TextStyle(color: MyColors.myOrange),),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset("assets/ic_search.png")],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: size.width - 30,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: Image.asset("assets/ring.png"),
                        )),
                    ImageView360(
                      key: UniqueKey(),
                      imageList: imageList,
                      autoRotate: autoRotate,
                      rotationCount: rotationCount,
                      swipeSensitivity: swipeSensitivity,
                      allowSwipeToRotate: allowSwipeToRotate,
                      onImageIndexChanged: (currentImageIndex) {
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                  decoration:const BoxDecoration(
                      color: MyColors.grayBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Nike Air Max Pre-Day",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber,),
                            RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  text: "5.0",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16.0,)),
                            ),
                            const SizedBox(width: 5,),
                            RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  text: "(1125 Review)",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16.0,)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Men's sneakers are made with leather upper features for durability and support, while perforations provide airflow during every shoe wear.",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 16.0,)),
                        ),
                        const SizedBox(height: 10,),
                        RichText(
                          textAlign: TextAlign.start,
                          text: const TextSpan(
                              text: "Select Color :",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.0,)),
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: buildColorWidgets(),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
