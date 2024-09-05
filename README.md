# Hungro

Hungro is an oriental cuisine restaurant app built using Flutter, available on Android, iOS, and web platforms. It offers a seamless experience for users to explore the restaurant's menu, add items to their cart, and proceed to checkout. The app features a dark theme for an enhanced visual experience.

Hungro is already hosted and accessible via mobile and desktop browsers. https://hungro-50299.web.app/

## Overview

Hungro is currently a single vendor app focused on the client side. However, there are plans to develop the business side in the future. It leverages Flutter for cross-platform development, allowing users to access the app on their preferred devices.

## Features

- **Authentication**: Utilizes Firebase for user authentication, ensuring secure access to the app.
- **Firestore Integration**: Stores details of cart items, total bill, and other relevant information in Firestore for efficient data management.
- **Menu Exploration**: Users can browse the restaurant's menu, view item details, and add desired items to their cart.
- **Checkout Process**: Seamless checkout process with the option to pay via card. Currently, a dummy card feature is implemented using the `flutter_credit_card` package.
- **Receipt Display**: Upon successful payment, users receive a receipt confirming their order.
- **Dark Theme**: Offers a dark theme option for improved visibility in low-light environments.
- **Cart Management**: Users can easily manage their cart, including emptying it when needed.
- **Logout Functionality**: Allows users to securely log out of their accounts.

### Platforms

- Android
- iOS
- Web

### Technologies Used

- Flutter
- Firebase

### Installation

1. Clone the repository to your local machine:

 ```bash
   git clone https://github.com/mrcodefrost/hungro_food_delivery.git
 ```

2. Navigate to the project directory:

 ```bash
   cd hungro_food_delivery
 ```

3. Install dependencies by running this command in IDE terminal:

 ```bash
   flutter pub get
 ```

4. Set up Firebase:

If you haven't already, [sign in to your Firebase account](https://firebase.google.com/docs/web/setup).
Install Firebase CLI globally using IDE Terminal:

Log in to Firebase
 ```bash
   firebase login
 ```

Activate Flutterfire CLI
 ```bash
   flutter pub global activate flutterfire_cli
 ```


## Future Development

In the future, Hungro aims to expand its functionality by implementing the business side of the application. This will enhance the overall user experience and provide additional features for both users and restaurant owners.



