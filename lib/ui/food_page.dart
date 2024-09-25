part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        //   Header
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food Market",
                    style: blackFontStyle1,
                  ),
                  Text(
                    "Let's get some food!",
                    style: blackFontStyle2,
                  )
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .picturePath ??
                          'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded).user.name}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        //   card food
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (_, state) => (state is FoodLoaded)
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: mockFoods
                        .map(
                          (food) => Padding(
                            padding: EdgeInsets.only(
                                left: (food == mockFoods.first)
                                    ? defaultMargin
                                    : 0,
                                right: defaultMargin),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  DetailPage(
                                    onBackButtonPressed: () {
                                      Get.back();
                                    },
                                    transaction: Transaction(
                                        food: food,
                                        user: (context.read<UserCubit>().state
                                                as UserLoaded)
                                            .user),
                                  ),
                                );
                              },
                              child: FoodCard(
                                food: food,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Center(),
          ),
        ),
        //   tab layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              CustomTabbar(
                selectedIndex: selectedIndex,
                titles: [
                  'New Taste',
                  'Popular',
                  'Recommended',
                ],
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) {
                  if (state is FoodLoaded) {
                    List<Food> foods = state.foods
                        .where(
                          (e) => e.types!.contains(
                            (selectedIndex == 0)
                                ? FoodType.new_food
                                : ((selectedIndex == 1)
                                    ? FoodType.popular
                                    : FoodType.recommended),
                          ),
                        )
                        .toList();

                    return Column(
                      children: foods
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailPage(
                                      onBackButtonPressed: () {
                                        Get.back();
                                      },
                                      transaction: Transaction(
                                          food: e,
                                          user: (context.read<UserCubit>().state
                                                  as UserLoaded)
                                              .user),
                                    ),
                                  );
                                },
                                child: FoodListItem(
                                  food: e,
                                  itemWidth: listItemWidth,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
