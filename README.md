
# 📱 BMI Calculator App (Flutter Learning Project)

This is a BMI Calculator App I built by following a Flutter beginner course.  
As someone who is currently learning Flutter, this project helped me understand the basics of layout, state, and widget structuring in Flutter.

---

## ✨ What I Learned

- How to use `StatefulWidget` and `StatelessWidget`
- How to manage state using `setState()`
- How to use layout widgets like `Column`, `Row`, `Expanded`, and `Slider`
- How to create and reuse custom widgets (`ReusableCard`, `IconContent`, `RoundIconButton`)
- How to navigate between screens using `Navigator`
- How to separate logic and UI (BMI calculation logic is written in `calculator_brain.dart`)
- How to organize styles and constants in a single `constants.dart` file

---

## 🚀 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/Edibulb/bmi_calculator_flutter.git
cd bmi_calculator_flutter
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 📂 Files Overview

```
lib/
│
├── main.dart                  # App entry point
├── constants.dart             # Design constants (colors, text styles)
│
├── calculator_brain.dart     # BMI calculation logic
│
├── components/               # Custom reusable widgets
│   ├── buttom_button.dart
│   ├── reusable_card.dart
│   ├── icon_content.dart
│   └── round_icon_button.dart
│
└── screens/
    ├── input_page.dart       # Main input screen
    └── results_page.dart     # Result screen
```

---

## 📦 Dependencies

- `flutter`
- `font_awesome_flutter`

---

## 🎓 Attribution

This project was inspired by a Flutter course on Udemy,  
but all code was restructured, customized, and explained with my own understanding and comments.

> 📌 I’m currently studying software in New Zealand and learning Flutter step by step.  
> I hope this app shows my growth as a developer and motivates others to start building too.

---

## 👤 About Me

- **Byeonghun Kang**
- 🏫 Studying in New Zealand | 📱 Aspiring Flutter Developer
- 📧 gnsqud24@naver.com
- 🌐 www.linkedin.com/in/byeonghun-kang-b5b402240

---