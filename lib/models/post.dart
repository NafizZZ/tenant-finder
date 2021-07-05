import 'package:tenant_finder/constants.dart';
class Post{

  int id;
  // String status;
  String posted_by;
  String address;
  String size_of_place;
  String bedroom_no;
  String rent_commencement_date;
  String rental_price;
  String booking_money;
  // String rental_type;
  bool rental_type_family;
  bool rental_type_bachelor;
  String description;

      // this.status, this.rental_type, 
  Post({this.id, this.posted_by, this.address, this.size_of_place, this.bedroom_no, this.rent_commencement_date, this.rental_price, this.booking_money, this.rental_type_family, this.rental_type_bachelor, this.description});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic> {
      // colStatus: status,
      colPostedBy: posted_by,
      colAddress: address,
      colSizeOfPlace: size_of_place,
      colBedroomNo: bedroom_no,
      colRentCommencementDate: rent_commencement_date,
      colRentalPrice: rental_price,
      colBookingMoney: booking_money,
      // colRentalType: rental_type,
      colRentalTypeFamily: rental_type_family,
      colRentalTypeBachelor: rental_type_bachelor,
      colDescription: description,
    };
    if(id != null) map[colId] = id;
    return map;
  }

  Post.fromMap(Map<String, dynamic> map){
    id = map[colId];
    // status = map[colStatus];
    posted_by = map[colPostedBy];
    address = map[colAddress];
    size_of_place = map[colSizeOfPlace];
    bedroom_no = map[colBedroomNo];
    rent_commencement_date = map[colRentCommencementDate];
    rental_price = map[colRentalPrice];
    booking_money = map[colBookingMoney];
    // rental_type = map[colRentalType];
    rental_type_family = map[colRentalTypeFamily];
    rental_type_bachelor = map[colRentalTypeBachelor];
    description = map[colDescription];
  }
}
