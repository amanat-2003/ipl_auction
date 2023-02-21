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
  String name;
  num number;
  num battingIdx;
  num bowlingIdx;
  num fieldingIdx;
  String imageAddress;
  num basePrice;
  Player({
    required this.name,
    required this.number,
    required this.battingIdx,
    required this.bowlingIdx,
    required this.fieldingIdx,
    required this.imageAddress,
    required this.basePrice,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['cricket_player_name'],
      number: map['player_number'],
      battingIdx: map['batting_index'],
      bowlingIdx: map['bowling_index'],
      fieldingIdx: map['fielding_index'],
      imageAddress: map['player_image_address'],
      basePrice: map['base_price']
    );
  }
}
