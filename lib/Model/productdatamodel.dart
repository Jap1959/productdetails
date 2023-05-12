class Datamodel{
  late final int id;
  late final String title;
  late final String description;
  late final double price;
  late final double discount;
  late final String image;
  late final int qty;
  Datamodel({required this.id,required this.title,required this.description,required this.price,required this.image,required this.discount,required this.qty});
  factory Datamodel.fromJson(Map<String,dynamic> json){
     return Datamodel(id: json['id'], title: json['title'], description: json['description'], price: json['price'],
         image: json['images'][0], discount: json['discountPercentage'],
         qty: json['stock']
     );
  }
}
