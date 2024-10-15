part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/photo_border.png'),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        (context.read<UserCubit>().state as UserLoaded)
                                .user
                                .picturepath ??
                            'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded)}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              (context.read<UserCubit>().state as UserLoaded).user.name ??
                  'Name',
              style: blackFontStyle1,
            ),
            Text(
              (context.read<UserCubit>().state as UserLoaded).user.email ??
                  'email',
              style: greyFontStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: "white".toColor(),
            ),
            Divider(
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomTabBar(
                        selectedIndex: selectedIndex,
                        titles: [
                          'Account',
                          'FoodMarket',
                        ],
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    (selectedIndex == 0)
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Edit Profile',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Home Address',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Security',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Payments',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.read<UserCubit>().signOut();
                                        Get.to(SignInPage());
                                      },
                                      child: Text(
                                        'Sign Out',
                                        style: blackFontStyle2,
                                      ),
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rate App',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Help Center',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Privacy & Policy',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Term & Conditions',
                                      style: blackFontStyle2,
                                    ),
                                    Icon(
                                      MdiIcons.chevronRight,
                                      size: 40,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
