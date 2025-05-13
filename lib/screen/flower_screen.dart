import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phul_ecom_partner/blocs/cart/bloc/addtocart_bloc.dart';
import 'package:phul_ecom_partner/blocs/internetConnectivity/cubit/internetconnection_cubit.dart';
import 'package:phul_ecom_partner/data/model/add_cart_model.dart';
import 'package:phul_ecom_partner/data/static_data/static_data.dart';
import 'package:phul_ecom_partner/utility/app_bar.dart';
import 'package:phul_ecom_partner/utility/app_drawer.dart';
import 'package:phul_ecom_partner/widget/date_slab.dart';

class FLowserDetail extends StatefulWidget {
  const FLowserDetail({
    super.key,
    required this.name,
    required this.ratings,
    required this.image,
    required this.itemId,
    required this.price,
  });
  final String name;
  final String ratings;

  final String image;
  final String itemId;
  final String price;
  @override
  State<FLowserDetail> createState() => _FLowserDetailState();
}

class _FLowserDetailState extends State<FLowserDetail>
    with SingleTickerProviderStateMixin {
  // PageController controller = PageController();
  // int _curr = 0;
  int l = StaticData.review.length ~/ 2;

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this); // initialise it here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddtocartBloc, AddtocartState>(
      listener: (context, state) {
        if (state is Addtocart && state.move == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Item Added To Cart.."),
            ),
          );

          context.push(context.namedLocation("add-to-cart"));
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        onVerticalDragEnd: (DragEndDetails details) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          drawer: const MyDrawer(),
          appBar: MyAppBar.myApp(context),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  //fit: StackFit.expand,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.9,
                      child: PageView.builder(
                        padEnds: false,
                        //controller: controller,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.image,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          );
                        },
                      ),
                    ),
                    const Positioned(
                      top: 30,
                      right: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 30,
                          color: Colors.grey,
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 228, 223, 242),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "Same Day Delivery",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.deepPurpleAccent,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: RichText(
                          text: TextSpan(
                              text: widget.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                              children: [
                                TextSpan(
                                  text: "\n${widget.ratings}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        // fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black45,
                                      ),
                                ),
                              ]),
                        ),
                      ),
                      Text(
                        "₹\t${widget.price}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 25,
                              color: const Color.fromRGBO(202, 173, 89, 1),
                            ),
                      ),
                      Text(
                        "Check Product Delivery",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 7, 5, 0),
                              height: 2,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      pincodeMethod(context),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 0.14,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: DropdownButton<String>(
                            elevation: 0,
                            iconSize: 30,
                            alignment: AlignmentDirectional.center,
                            isExpanded: true,
                            underline: const SizedBox.shrink(),
                            hint: const Text("Saved Address"),
                            //value: 'Dog',

                            items: <String>['India', 'Pakistan', 'USA', 'UK']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SelectDate(),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      indicator: const UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black),
                          insets: EdgeInsets.symmetric(horizontal: 0.0)),
                      isScrollable: true,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Description'),
                        Tab(text: 'Product Info'),
                        Tab(text: 'More Info'),
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Colors.greenAccent,
                  constraints: const BoxConstraints(minHeight: 100),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(
                      //physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: <Widget>[
                        Text(
                          "Just like the morning rays, they emanate positive vibes only. Add that radiant energy to your loved one's special day with a deftly curated assortment of love - A yellow trunk, aloe vera plant, blueberry jar cake, choco fill cookies and dried flowers greeting card.",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade600,
                                  ),
                          textAlign: TextAlign.start,
                        ),

                        Text(
                          "ConstituentsCenter Filled Choco-Cookies Aloe Vera Plant Care Guide Green Pot Yellow Trunk Box Blueberry Jar Cake 200 Gms Dried Flowers Card Flowers Specifications Center Filled Choco-Cookies Weight: 75gms Aloe Vera Plant L X B X H: cmPlant Type: Aloe Vera PlantPlant Height: Uptoo 7 InchesCare GuideGreen PotSize: 4 InchesMaterial: PlasticYellow Trunk BoxSize: 24 x 10 cmMaterial: MetalBlueberry Jar Cake 200 GmsFlavours: BlueberryWeight: 200GmsDried Flowers CardFlowersNo. of Stems: 2Type of Flowers: Wheat Grass ,Gypso ,Limonium ,StaticeColour of Flower: AssortedCountry of Origin: India",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade600,
                                  ),
                          textAlign: TextAlign.start,
                          maxLines: 40,
                        ),
                        // ListView.builder(
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return ListTile(
                        //       title: Text("bubjbhjvhj"),
                        //     );
                        //   },
                        //   itemCount: 10,
                        // ),
                        Text(
                          "Delivery Info Delivered product might vary slightly from the image shown.This product is perishable therefore delivery will be attempted only once.The delivery cannot be redirected to any other address.",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade600,
                                  ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                ReviewSection(
                  l: l,
                  onTap: () {
                    if (l != StaticData.review.length) {
                      setState(() {
                        l = l + 5;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: AddToCart(
            topSeller: TopSeller(
                id: int.parse(widget.itemId),
                title: widget.name,
                price: widget.price,
                ratings: widget.ratings,
                image: widget.image),
          ),
        ),
      ),
    );
  }

  Container pincodeMethod(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.26,
              height: MediaQuery.of(context).size.width * 0.12,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 15,
                  ),
                  hintText: "Country",
                  hintStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.width * 0.12,
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: "Pincode/Location",
                  hintStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2)),
              width: MediaQuery.of(context).size.width * 0.22,
              height: MediaQuery.of(context).size.width * 0.12,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Out of World")));
                },
                child: Center(
                  child: Text(
                    "Check",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({
    Key? key,
    required this.l,
    required this.onTap,
  }) : super(key: key);

  final int l;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Our Happy Customers Review",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: l,
            itemBuilder: (context, index) {
              List<Review> data = StaticData.review;
              return Container(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.account_circle_outlined),
                      title: Text(data[index].name),
                      subtitle: Text(data[index].place),
                      trailing: const Text("17-06-2023"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.18),
                      child: Text(
                        data[index].msg,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        l != StaticData.review.length
            ? Center(
                child: ElevatedButton(
                  // onPressed: () {
                  //   if (l != StaticData.review.length) {
                  //     setState(() {
                  //       l = l + 5;
                  //     });
                  //   }
                  // },
                  onPressed: onTap,
                  child: Text(
                    "More",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.topSeller,
  }) : super(key: key);
  final TopSeller topSeller;
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetconnectionCubit, InternetconnectionState>(
      listener: (BuildContext context, state) {
        if (state is InternetDisconnected) {
          context.pushNamed("noInternet");
        } else {
          context.pop();
        }
      },
      child: Container(
        color: Colors.transparent,
        //height: 50,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(202, 173, 89, 1),
            ),
            onPressed: () {
              // context.pushNamed("login");
              context.read<AddtocartBloc>().add(
                    AddToCartData(
                      topSeller: Carting(
                        id: topSeller.id,
                        title: topSeller.title,
                        price: topSeller.price,
                        ratings: topSeller.ratings,
                        image: topSeller.image,
                        size: 1,
                        totalAmount: 1 * (int.parse(topSeller.price)).toInt(),
                      ),
                    ),
                  );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  size: 30.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
