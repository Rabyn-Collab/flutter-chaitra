


class User{

  final String username;
  final String phone;
  final String email;
  final String gender;
  final String country;
  final String id;


  User(
      {
        required this.username,
        required this.phone,
        required this.email,
        required this.gender,
        required this.country,
        required this.id
      }
      );
  factory User.fromJson(Map<String,dynamic>json){
    return User(
        username: json['username'],
        phone:json['phone'],
        email:json['email'],
        gender:json['gender'],
        country:json['country'],
        id:json['id']
    );
  }

}