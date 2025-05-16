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
  String playerName;
  num playerNo;
  num rating;
  String pathOfImage;
  num basePrice;
  String playerRole;

  Player({ 
    required this.playerName,
    required this.playerNo,
    required this.rating,
    required this.pathOfImage,
    required this.basePrice,
    required this.playerRole,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
        playerName: map['player_name'],
        playerNo: map['player_no'],
        rating: map['rating'],
        pathOfImage: map['path_of_image'],
        basePrice: map['base_price'],
        playerRole: map['player_role']);
  }
}
