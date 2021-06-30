import 'package:tenant_finder/constants.dart';
class Post{

  int id;
  String address;
  String sizeOfPlace;
  String rentCommencementDate;
  String rentalPrice;
  String bookingMoney;
  String description;

  Post({this.id, this.address, this.sizeOfPlace, this.rentCommencementDate, this.rentalPrice, this.bookingMoney, this.description});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      colAddress: address,
      colSizeOfPlace: sizeOfPlace,
      colRentCommencementDate: rentCommencementDate,
      colRentalPrice: rentalPrice,
      colBookingMoney: bookingMoney,
      colDescription: description,
    };
    if(id != null) map[colId] = id;
    return map;
  }

  Post.fromMap(Map<String, dynamic> map){
    id = map[colId];
    address = map[colAddress];
    sizeOfPlace = map[colSizeOfPlace];
    rentCommencementDate = map[colRentCommencementDate];
    rentalPrice = map[colRentalPrice];
    bookingMoney = map[colBookingMoney];
    description = map[colDescription];

  }
}
