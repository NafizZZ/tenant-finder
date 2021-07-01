import 'package:tenant_finder/constants.dart';
class Post{

  int id;
  String address;
  String size_of_place;
  String rent_commencement_date;
  String rental_price;
  String booking_money;
  String description;

  Post({this.id, this.address, this.size_of_place, this.rent_commencement_date, this.rental_price, this.booking_money, this.description});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      colAddress: address,
      colSizeOfPlace: size_of_place,
      colRentCommencementDate: rent_commencement_date,
      colRentalPrice: rental_price,
      colBookingMoney: booking_money,
      colDescription: description,
    };
    if(id != null) map[colId] = id;
    return map;
  }

  Post.fromMap(Map<String, dynamic> map){
    id = map[colId];
    address = map[colAddress];
    size_of_place = map[colSizeOfPlace];
    rent_commencement_date = map[colRentCommencementDate];
    rental_price = map[colRentalPrice];
    booking_money = map[colBookingMoney];
    description = map[colDescription];

  }
}
