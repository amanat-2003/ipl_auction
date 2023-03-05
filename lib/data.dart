// ignore_for_file: public_member_api_docs, sort_constructors_first
class Players {
  static List<Player> players = [
    // Player(
    //     name: 'Virat Kohli',
    //     number: 18,
    //     battingIdx: 9.8,
    //     bowlingIdx: 5.2,
    //     fieldingIdx: 8.5,
    //     imageUrl:
    //         'https://upload.wikimedia.org/wikipedia/commons/5/57/Shri_Virat_Kohli_for_Cricket%2C_in_a_glittering_ceremony%2C_at_Rashtrapati_Bhavan%2C_in_New_Delhi_on_September_25%2C_2018_%28cropped%29.JPG'),
  ];
}

class Player {
  String player_name;
  num player_no;
  num rating;
  String path_of_image;
  num base_price;
  String player_role;

  Player({ 
    required this.player_name,
    required this.player_no,
    required this.rating,
    required this.path_of_image,
    required this.base_price,
    required this.player_role,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
        player_name: map['player_name'],
        player_no: map['player_no'],
        rating: map['rating'],
        path_of_image: map['path_of_image'],
        base_price: map['base_price'],
        player_role: map['player_role']);
  }
}
