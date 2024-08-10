# IPL Auction Flutter Web App

## Overview

The IPL Auction Flutter Web App is a web application built with Flutter that simulates an IPL (Indian Premier League) auction portal. It allows users to view and bid on cricket players in a mock auction setting.

## Features

- **Player Management**: View player details such as name, base price, rating, and role.
- **Bid Management**: Increment and decrement bids in a user-friendly interface.
- **Player Navigation**: Navigate through different players and view their images and details.
- **Responsive Design**: Adapts to different screen sizes with a visually appealing background.

## Live Demo

You can try out the app live [here](https://ipl-amanat.anamihub.com/).

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Basic knowledge of Flutter and Dart

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/ipl_auction.git
   cd ipl_auction
   ```

2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Add Assets**

   Ensure you have the required assets (`data.json`, images) in the `assets` directory. 

4. **Run the App**

   ```bash
   flutter run -d chrome
   ```

## Code Structure

- **`main.dart`**: The entry point of the application. Sets up the `MaterialApp` and main screen with player bidding functionality.
- **`data.dart`**: Contains data models for `Player` and static data for `Players`.
- **`widgets.dart`**: Provides utility widgets and functions, including input decorations and navigation helpers.

## Assets

- **`assets/data.json`**: JSON file containing player data. Ensure this file is correctly formatted with player details.
- **`assets/pics/`**: Directory containing player images and background images used in the app.

## Usage

1. **Viewing a Player**

   Use the text field to enter a player number and view details like image, base price, rating, and role.

2. **Adjusting the Bid**

   Use the '+' and '-' buttons to increment or decrement the current bid amount.

3. **Navigating Players**

   Use the arrow buttons to navigate through the list of players.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or issues, please contact [amanatsinghnain@gmail.com](mailto:amanatsinghnain@gmail.com).
