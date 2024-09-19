import 'package:animated_product_tile/provider/home_provider.dart';
import 'package:animated_product_tile/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 6.h),
            CustomTextWidget(
                title: 'Home', fontSize: 19.sp, fontWeight: FontWeight.w600),
            Expanded(
                child: ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    itemCount: homeProvider.productList.length,
                    itemBuilder: (context, index) {

                      final isExpanded = homeProvider.productList[index].isExpanded;
                      final showMainChildWidgets = homeProvider.productList[index].showMainChildWidgets;
                      final showChildChildWidgets = homeProvider.productList[index].showChildChildWidgets;
                      final expandChildTile = homeProvider.productList[index].expandChildTile;
                      final animateChildChildWidgets = homeProvider.productList[index].animateChildChildWidgets;
                      final animateMainChildWidgets = homeProvider.productList[index].animateMainChildWidgets;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(expandChildTile
                                            ? 0
                                            : 0.1),
                                    blurRadius: 1,
                                    spreadRadius: 1
                                )
                              ]
                          ),
                          height: expandChildTile ? 33.h : 15.h,
                          width: double.infinity,
                          child:  Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                decoration: BoxDecoration(
                                    color: homeProvider.productList[index].color,
                                    borderRadius:  BorderRadius.only(
                                      topLeft: const Radius.circular(15),
                                      bottomLeft: const Radius.circular(15),
                                      bottomRight: Radius.circular(expandChildTile?15:0),
                                      topRight: Radius.circular(expandChildTile?15:0),
                                    )
                                ),
                                height: double.maxFinite,
                                width:expandChildTile?92.w: 30.w,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ZoomIn(
                                      animate: animateMainChildWidgets,
                                      child: Visibility(
                                        visible: showMainChildWidgets,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Image.asset(homeProvider.productList[index].image),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ZoomIn(
                                                    animate: animateChildChildWidgets,
                                                    child: Visibility(
                                                      visible: showChildChildWidgets,
                                                      child: Container(
                                                          constraints: BoxConstraints(maxWidth: 40.w),
                                                          child: CustomTextWidget(title: homeProvider.productList[index].productName,fontSize: 20.sp,maxLines: 1,)),
                                                    ),
                                                  ),
                                                  ZoomIn(
                                                    animate: animateChildChildWidgets,
                                                    child: Visibility(
                                                      visible: showChildChildWidgets,
                                                      child: CustomTextWidget(title: 'Price: \$${homeProvider.productList[index].price}',fontSize: 18.sp,color: Colors.orange,fontWeight: FontWeight.bold,),
                                                    ),
                                                  ),
                                                  ZoomIn(
                                                    animate: animateChildChildWidgets,
                                                    child: Visibility(
                                                      visible: showChildChildWidgets,
                                                      child: Row(
                                                        children: List.generate(
                                                            homeProvider.productList[index].rating,
                                                                (context){
                                                              return const Icon(Icons.star_rate_rounded,size: 16,color: Colors.green,);
                                                            }
                                                        )
                                                      )
                                                    ),
                                                  ),
                                                  ZoomIn(
                                                    animate: animateChildChildWidgets,
                                                    child: Visibility(
                                                      visible: showChildChildWidgets,
                                                      child: SizedBox(height: 1.h,),
                                                    ),
                                                  ),
                                                  ZoomIn(
                                                    animate: animateChildChildWidgets,
                                                    child: Visibility(
                                                      visible: showChildChildWidgets,
                                                      child: Container(
                                                          constraints: BoxConstraints(maxWidth: 40.w),
                                                          child: CustomTextWidget(title: homeProvider.productList[index].details,fontSize: 16.sp,color: Colors.blueGrey,)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ZoomIn(
                                                animate: animateChildChildWidgets,
                                                child: Visibility(
                                                  visible: showChildChildWidgets,
                                                  child: SizedBox(
                                                    height: 20.h,
                                                    width: 20.h,
                                                    child: Image.asset(homeProvider.productList[index].image),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ZoomIn(
                                                animate: animateChildChildWidgets,
                                                child: Visibility(
                                                  visible: showChildChildWidgets,
                                                  child: MaterialButton(
                                                    minWidth: 25.w,
                                                    height: 6.h,
                                                    elevation: 0,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                    ),
                                                    color: homeProvider.darkenColor(homeProvider.productList[index].color,0.5),
                                                      onPressed: (){},
                                                    child: CustomTextWidget(title: 'Buy Now',color: Colors.white,),
                                                  )
                                                ),
                                              ),
                                              SizedBox(width: 2.w,),
                                              ZoomIn(
                                                animate: animateChildChildWidgets,
                                                child: Visibility(
                                                    visible: showChildChildWidgets,
                                                    child: MaterialButton(
                                                      minWidth: 35.w,
                                                      height: 6.h,
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      color: Colors.blueGrey,
                                                      onPressed: (){},
                                                      child: CustomTextWidget(title: 'Add to Cart',color: Colors.white,),
                                                    )
                                                ),
                                              ),
                                              SizedBox(width: 2.w,),
                                              ZoomIn(
                                                animate: animateChildChildWidgets,
                                                child: Visibility(
                                                    visible: showChildChildWidgets,
                                                    child: MaterialButton(
                                                      minWidth: 10.w,
                                                      height: 6.h,
                                                      elevation: 0,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      color: homeProvider.darkenColor(homeProvider.productList[index].color,0.2),
                                                      onPressed: (){
                                                        homeProvider.productList[index].animateChildChildWidgets = false;
                                                        homeProvider.toggleDisplayView(homeProvider.productList[index], index);
                                                        Future. delayed(const Duration(milliseconds: 700), () {
                                                          homeProvider.productList[index].showChildChildWidgets = false;
                                                          homeProvider.productList[index].expandChildTile = false;
                                                          homeProvider.productList[index].isExpanded = false;
                                                          homeProvider.toggleDisplayView(homeProvider.productList[index], index);
                                                          Future. delayed(const Duration(milliseconds: 1000), () {
                                                            homeProvider.productList[index].showMainChildWidgets = true;
                                                            homeProvider.productList[index].animateMainChildWidgets = true;
                                                            homeProvider.productList[index].expandChildTile = false;
                                                            homeProvider.productList[index].isExpanded = false;
                                                            homeProvider.toggleDisplayView(homeProvider.productList[index], index);
                                                          });
                                                        });

                                                      },
                                                      child: Image.asset('assets/images/collapse.png',color: Colors.white,height: 30,width: 30),
                                                    )
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: showMainChildWidgets,
                                child: SizedBox(
                                  width: 3.w,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ZoomIn(
                                    animate: animateMainChildWidgets,
                                    child: Visibility(
                                      visible: showMainChildWidgets,
                                      child: CustomTextWidget(
                                          title: homeProvider.productList[index].productName,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h,),
                                  ZoomIn(
                                    animate: animateMainChildWidgets,
                                    child: Visibility(
                                      visible: showMainChildWidgets,
                                      child: CustomTextWidget(
                                          title: 'Price: \$${homeProvider.productList[index].price}',
                                          fontSize: 17.5.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange,

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  ZoomIn(
                                    animate: animateMainChildWidgets,
                                    child: Visibility(
                                      visible: showMainChildWidgets,
                                      child: Row(
                                        children: List.generate(
                                            homeProvider.productList[index].rating,
                                            (context){
                                              return const Icon(Icons.star_rate_rounded,size: 16,color: Colors.green,);
                                            }
                                        )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ZoomIn(
                                animate: animateMainChildWidgets,
                                child: Visibility(
                                  visible: showMainChildWidgets,
                                  child: IconButton(
                                      onPressed: (){
                                        homeProvider.productList[index].animateMainChildWidgets = false;
                                        homeProvider.toggleDisplayView(homeProvider.productList[index], index);
                                        Future. delayed(const Duration(milliseconds: 700), () {
                                          homeProvider.productList[index].showMainChildWidgets = false;
                                          homeProvider.productList[index].expandChildTile = true;
                                          homeProvider.toggleDisplayView(homeProvider.productList[index], index);
                                          Future. delayed(const Duration(milliseconds: 1000), () {
                                            homeProvider.productList[index].showChildChildWidgets = true;
                                            homeProvider.productList[index].animateChildChildWidgets = true;
                                            homeProvider.productList[index].isExpanded = true;
                                            homeProvider.toggleDisplayView(homeProvider.productList[index], index);
                                          });
                                        });
                                        },
                                      icon: Icon(Icons.chevron_right,size: 25.sp))
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    }))
          ],
        );
      }),
    );
  }
}
