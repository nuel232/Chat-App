# Chat App

A Flutter-based chat application with authentication, theming, and custom UI components.

## Features

- User authentication (login & registration pages)
- Home page scaffold
- Custom reusable Button and TextField components
- Light mode theming
- Modern, clean UI

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=3.8.1)
- Dart

### Installation

1. Clone the repository:

   ```sh
   git clone <repo-url>
   cd chat_app
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:

   ```sh
   flutter run
   ```

## Project Structure

- `lib/main.dart` - App entry point, sets up theming and authentication flow
- `lib/auth/loginOrRegister.dart` - Handles toggling between login and registration
- `lib/pages/login_page.dart` - Login UI and logic
- `lib/pages/register_page.dart` - Registration UI and logic
- `lib/pages/home_page.dart` - Home page scaffold
- `lib/components/my_button.dart` - Custom button widget
- `lib/components/my_textfield.dart` - Custom text field widget
- `lib/themes/light_mode.dart` - Light mode theme configuration

## Theming

The app uses a custom light mode theme defined in `lib/themes/light_mode.dart`.

## Custom Components

- **MyButton**: A reusable button styled to match the app theme
- **MyTextfield**: A reusable text field with themed borders and hint text

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
