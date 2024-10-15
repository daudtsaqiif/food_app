part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).user.name!;
    super.initState();
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.phoneNumber!;
    super.initState();
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.houseNumber!;
    super.initState();
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).user.address!;
    super.initState();
    cityController.text =
        (context.read<UserCubit>().state as UserLoaded).user.city!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your profile'),
        backgroundColor: MainColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  'Name:',
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your new name',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  'House Number:',
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: houseNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your new house number',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  'phone number',
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your new phone number',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  'address',
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your new address',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  'city',
                  style: blackFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: 'Type your new city',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: (isLoading == true)
                    ? loadingIndicator
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          User user =
                              (context.read<UserCubit>().state as UserLoaded)
                                  .user
                                  .copywith(
                                    name: nameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    houseNumber: houseNumberController.text,
                                    address: addressController.text,
                                    city: cityController.text,
                                  );
                          ApiReturnValue<User> result =
                              await UserServices.updateProfile(user);
                        },
                        child: Text(
                          'Update Profile',
                          style: blackFontStyle3.copyWith(color: Colors.white),
                        ),
                      ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
