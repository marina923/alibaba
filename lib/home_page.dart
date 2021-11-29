import 'package:amlak/layout/cubit/cubit.dart';
import 'package:amlak/layout/cubit/states.dart';
import 'package:amlak/shared/components/card_item.dart';
import 'package:amlak/shared/components/gradient_text.dart';
import 'package:amlak/shared/components/reusable_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var dropDownValue = 'للبيع';
    var items = ['للبيع', 'للايجار'];
    AppCubit.get(context).getLowestPrice();
    AppCubit.get(context).getRecent();
    var lowestPriceList = AppCubit.get(context).lowestPrice;
    var recentList = AppCubit.get(context).recent;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                expandedHeight: 280.0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                    ),
                  ),
                ],
                title: const Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage('assets/images/logo_horizontal.png'),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      const Image(
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
                          style: const TextStyle(
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
                        child: SizedBox(
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
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.black54,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'إبحث عن',
                                    hintStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                              const SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    alignment: AlignmentDirectional.center,
                                    value: dropDownValue,
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }).toList(),
                                    icon: const Icon(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
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
                    ),
                    SizedBox(
                      height: height * 0.49,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: lowestPriceList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: width * 0.5,
                            child: CardItem(
                              mainImagePreview: lowestPriceList[index]
                                  ["featured_image"]["thumbnail"],
                              realEstateName: lowestPriceList[index]["type"]
                                  ["name"],
                              realEstateSellingStatus: lowestPriceList[index]
                                  ["status"],
                              realEstateTitle: lowestPriceList[index]["title"],
                              realEstatePrice: lowestPriceList[index]["price"],
                              realEstateAddress: lowestPriceList[index]
                                  ["address"],
                              realEstateSize: lowestPriceList[index]["size"],
                              realEstateBedrooms: lowestPriceList[index]
                                  ["bedrooms"],
                              realEstateBathrooms: lowestPriceList[index]
                                  ["bathrooms"],
                              onPressFavoriteButton: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'إظهار الكل',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.only(end: width * 0.06),
                          child: Text(
                            'أحدث العقارات',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.497,
                      child: GridView.count(
                        childAspectRatio: 2 / 4.2,
                        crossAxisCount: 2,
                        children: List.generate(
                          recentList.length,
                          (index) => CardItem(
                            mainImagePreview: recentList[index]
                                ["featured_image"]["thumbnail"],
                            realEstateName: recentList[index]["type"]["name"],
                            realEstateSellingStatus: recentList[index]
                                ["status"],
                            realEstateTitle: recentList[index]["title"],
                            realEstatePrice: recentList[index]["price"],
                            realEstateAddress: recentList[index]["address"],
                            realEstateSize: recentList[index]["size"],
                            realEstateBedrooms: recentList[index]["bedrooms"],
                            realEstateBathrooms: recentList[index]["bathrooms"],
                            onPressFavoriteButton: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
