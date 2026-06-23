# 🚌 UniPass - University Bus Pass App

A sleek, cross-platform mobile application built with Flutter, designed to streamline the university bus commuting experience. UniPass replaces physical bus cards with a digital pass and provides a dynamic, real-time schedule interface.

![Flutter](https://img.shields.io/badge/Flutter-3.24.0-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.5.0-0175C2?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

*   **🔐 Seamless Authentication:** Clean, modern login and registration screens with form validation.
*   **🪪 Digital Bus Pass:** A beautifully designed digital card displaying student details, residence, and a placeholder for a scannable QR code.
*   **📅 Smart Bus Schedule:** 
    *   Vertical timeline UI for clear chronological reading.
    *   Automatically scrolls to and highlights the **next available bus**.
    *   Visual distinction between departed buses (solid line/filled dot) and upcoming buses (dashed line/outlined dot).
*   **🎛️ Advanced Filtering:** Filter buses by day, type (Normal/Grocery), direction (To/From Campus), and specific residence routes.
*   **🌙 Flawless Dark Mode:** Fully responsive Material 3 theming. Features an "inverted" UI design where cards and logos dynamically swap black/white colors to maintain perfect contrast in both light and dark modes.
*   **💎 Micro-interactions:** Smooth fade and slide-up animations on screen transitions.

## 🛠️ Tech Stack

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **UI/Fonts:** [Google Fonts](https://pub.dev/packages/google_fonts) (Bebas Neue & DM Sans)
*   **Timeline UI:** [timelines_plus](https://pub.dev/packages/timelines_plus)
*   **State Management:** `ValueNotifier` & `ValueListenableBuilder` (for global theme state)

## 🚀 Getting Started

### Prerequisites
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) (Latest stable version recommended)
*   An IDE like VS Code with the Flutter extension, or Android Studio.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Phantom-L0rd/bus_pass.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd unipass-app
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

## 📁 Project Structure

The codebase is organized to separate UI components, data models, and core app logic.

```text
lib/
│
├── main.dart                 # Entry point, Theme configuration, themeNotifier
├── models/
│   └── bus_schedule.dart     # Data models (Enums, BusScheduleItem, Mock Data)
│   └── student.dart          # Student data model
│
└── screens/
    ├── login_screen.dart     # Authentication UI
    ├── register_screen.dart  # Registration UI
    ├── main_screen.dart      # Shell UI (Appbar, Bottom Nav, Settings Sheet)
    ├── pass_screen.dart      # Digital Bus Pass UI
    └── schedule_screen.dart  # Timeline Schedule UI & Filtering logic
```

## 🎨 Design Highlights

### Dynamic Theming
Instead of hardcoding colors, the entire app relies on Flutter's `ColorScheme`. This allows the app to switch seamlessly between light and dark modes. 
*   `colorScheme.surface` handles backgrounds.
*   `colorScheme.onSurfaceVariant` handles subtle text/hints.
*   `colorScheme.surfaceContainerHighest` creates perfect "sunken" input fields without manual borders.

### Inverted Contrast UI
For the "U" logo and the "Next Bus" highlight card, the app uses `colorScheme.onSurface` for the background and `colorScheme.surface` for the text/icons. This creates a sleek negative-image effect: Black box with white text in Light Mode, and White box with black text in Dark Mode.

## 🔮 Future Roadmap

- [ ] **Backend Integration:** Connect to Firebase/Supabase for real user authentication.
- [ ] **QR Generation:** Integrate `qr_flutter` to generate unique, dynamic QR codes based on student IDs.
- [ ] **Live GPS Tracking:** Integrate Google Maps/Mapbox to show real-time bus locations.
- [ ] **Push Notifications:** Alert students 5 minutes before their usual bus arrives.
- [ ] **Offline Mode:** Cache schedule data using Hive or SQLite so students can check times without internet.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.