// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_task/dummyDb.dart';
import 'package:ui_task/view/gallery_screen/gallery_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            Text(
              "Banglore",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.white,
            )
          ],
        ),
        leading: Row(
          children: [
            SizedBox(
              child: Image.asset(
                "asset/images/menu1.png",
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(110),
            child: Column(
              children: [
                getAppBottomView(),
              ],
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "asset/images/b4 1.png",
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Specialities",
                  style: TextStyle(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryScreen(),
                          ));
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    //mainAxisExtent: 2,
                    mainAxisSpacing: 5,
                    // crossAxisSpacing: 10
                  ),
                  itemCount: Dummydb.imageList.length,
                  itemBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                            SizedBox(
                                height: 100,
                                child: Image.asset(Dummydb.imageList[index])),
                            Text(
                              Dummydb.categoryList[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

Widget getAppBottomView() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      child: SearchBar(
        leading: Text("Search..."),
        trailing: [Icon(Icons.search)],
      ),
    ),
  );
}
