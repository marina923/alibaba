import 'package:amlak/layout/cubit/cubit.dart';
import 'package:amlak/layout/cubit/states.dart';
import 'package:amlak/shared/components/card_item.dart';
import 'package:amlak/shared/components/gradientText.dart';
import 'package:amlak/shared/components/reusablecomponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var DropDownValue = 'للبيع';
    var items = ['للبيع', 'للايجار'];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit.get(context).getLowestPrice();
        var list = AppCubit.get(context).LowestPrice;
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              centerTitle: true,
              expandedHeight: 280.0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
              ],
              title: Image(
                height: 150.0,
                width: 150.0,
                image: AssetImage('assets/images/logo_horizontal.png'),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/images/egypt.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 80.0,
                        right: 8.0,
                        top: 90.0,
                      ),
                      child: GradientText(
                        'اكتشف منزلك الجديد بسهوله',
                        gradient: LinearGradient(
                          colors: [
                            Colors.amber.shade500,
                            Colors.lightGreen.shade600,
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 250.0,
                        bottom: 20.0,
                      ),
                      child: Container(
                        height: 35.0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                maxLines: 1,
                                controller: searchController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'إبحث عن',
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 6.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  alignment: AlignmentDirectional.center,
                                  value: DropDownValue,
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }).toList(),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageButton(name: 'للإيجار'),
                      myDivider(),
                      ImageButton(name: 'للبيع'),
                      myDivider(),
                      ImageButton(name: 'جميع العقارات'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إظهار الكل',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        'الأقل سعرا',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                    height: 400.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200.0,
                            child: CardItem(
                              mainImagePreview: 'assets/images/egypt.png',
                              realEstateName: 'شقه',
                              realEstateSellingStatus: 'للبيع',
                              realEstateTitle:
                              "شقه 2غرفه نوم للايجار فى ويست تاون-",
                              realEstatePrice: '15,222,000',
                              realEstateAddress:
                              "كمبوندات الشيخ زايد، الشيخ زايد، الجيزة، مصر",
                              realEstateSize: '125',
                              realEstateBedrooms: '6',
                              realEstateBathrooms: '3',
                              onPressFavoriteButton: () {},
                            ),
                          );
                        }))),
          ]),
          // SliverPadding(
          //     padding: const EdgeInsets.only(bottom: 8),
          //     sliver: SliverList(
          //         delegate: SliverChildBuilderDelegate((context, index) {
          //       return ListView.builder(
          //           shrinkWrap: true,
          //           physics: NeverScrollableScrollPhysics(),
          //           scrollDirection: Axis.horizontal,
          //           itemCount: 15,
          //           itemBuilder: (BuildContext context, int index) =>
          //               Container(child: Text("mmm")));
          //  CardItem(
          //   mainImagePreview: 'assets/images/egypt.png',
          //   realEstateName: 'شقه',
          //   realEstateSellingStatus: 'للبيع',
          //   realEstateTitle: "شقه 2غرفه نوم للايجار فى ويست تاون-",
          //   realEstatePrice: '15,222,000',
          //   realEstateAddress:
          //       "كمبوندات الشيخ زايد، الشيخ زايد، الجيزة، مصر",
          //   realEstateSize: '125',
          //   realEstateBedrooms: '6',
          //   realEstateBathrooms: '3',
          //   onPressFavoriteButton: () {},
          // ),
          // );
          //     })))
          // ]));
        );
      },
    );
  }
}
//CardItem(
//                         mainImagePreview: 'assets/images/egypt.png',
//                         realEstateName: 'شقه',
//                         realEstateSellingStatus: 'للبيع',
//                         realEstateTitle: "شقه 2غرفه نوم للايجار فى ويست تاون-",
//                         realEstatePrice: '15,222,000',
//                         realEstateAddress:
//                             "كمبوندات الشيخ زايد، الشيخ زايد، الجيزة، مصر",
//                         realEstateSize: '125',
//                         realEstateBedrooms: '6',
//                         realEstateBathrooms: '3',
//                         onPressFavoriteButton: () {},
//                       )