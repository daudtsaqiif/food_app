part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        address,
        houseNumber,
        phoneNumber,
        city,
        picturePath,
      ];
}

User mockUser = User(
  id: 1,
  name: 'Musalim Ucup',
  email: 'ucupweb@gmail.com',
  address: 'Jl. Setiabudi No.193',
  houseNumber: 'A27',
  phoneNumber: '08130987635',
  city: 'Bandung',
  picturePath: 'https://i.pinimg.com/474x/cc/dd/76/ccdd762641c8596cec666c7a30c3e822.jpg'
);
