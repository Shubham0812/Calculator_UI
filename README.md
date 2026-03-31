<p align="center">
  <h1 align="center">Calculator UI</h1>
  <p align="center">
    A beautifully crafted CASIO-inspired calculator built entirely with SwiftUI
  </p>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.0-orange?style=flat-square&logo=swift" alt="Swift 5.0" />
  <img src="https://img.shields.io/badge/iOS-15.0+-blue?style=flat-square&logo=apple" alt="iOS 15.0+" />
  <img src="https://img.shields.io/badge/SwiftUI-blue?style=flat-square&logo=swift&logoColor=white" alt="SwiftUI" />
  <img src="https://img.shields.io/github/license/Shubham0812/Calculator_UI?style=flat-square" alt="License" />
  <img src="https://img.shields.io/github/stars/Shubham0812/Calculator_UI?style=flat-square" alt="Stars" />
</p>

---

## Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/Shubham0812/Calculator_UI/main/Calculator_UI/Resources/screenshots/1.png" width="250" alt="Light Theme" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/Shubham0812/Calculator_UI/main/Calculator_UI/Resources/screenshots/2.png" width="250" alt="Light Theme with Computation" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/Shubham0812/Calculator_UI/main/Calculator_UI/Resources/screenshots/3.png" width="250" alt="Dark Theme" />
</p>

<p align="center">
  <em>Light Theme &nbsp;&bull;&nbsp; Computation &nbsp;&bull;&nbsp; Dark Theme</em>
</p>

## Features

- **Basic Arithmetic** — Addition, subtraction, multiplication, and division
- **Percentage & Sign Toggle** — Quick percentage calculations and plus/minus toggling
- **Decimal Support** — Full floating-point number input
- **CASIO-Inspired Design** — Retro-modern calculator aesthetic with custom display shape
- **Light & Dark Themes** — Adapts seamlessly to system appearance
- **Custom Typography** — Bungee and Eurostile Extended Black fonts for a distinctive look
- **Smooth Animations** — Satisfying button press effects and result transitions
- **Responsive Layout** — Adapts to different screen sizes using GeometryReader
- **Zero Dependencies** — Pure SwiftUI and Foundation, nothing else

## Requirements

| Platform | Minimum Version |
|----------|----------------|
| iOS      | 15.0+          |
| Swift    | 5.0            |
| Xcode    | 13.0+          |

## Getting Started

```bash
# Clone the repository
git clone https://github.com/Shubham0812/Calculator_UI.git

# Open in Xcode
cd Calculator_UI
open Calculator_UI.xcodeproj
```

Select your target device or simulator and hit **Run** (⌘R). No package resolution needed — the project has zero external dependencies.

## Architecture

The project follows the **MVVM (Model-View-ViewModel)** pattern for clean separation of concerns.

```
Calculator_UI/iOS/Code/
├── Features/Main/
│   ├── Models/
│   │   ├── DialPad.swift          # Button identifiers (0-9, operators)
│   │   └── Operation.swift        # Operation types enum
│   ├── ViewModels/
│   │   └── MainViewModel.swift    # Calculator logic & state
│   └── Views/
│       ├── MainView.swift         # Root calculator view
│       ├── CalculatorButtons.swift # Button grid layout
│       └── Support Views/
│           ├── DisplayView.swift   # Number display
│           └── CalculatorPad.swift # Individual button component
└── Common/
    ├── Controllers/               # App entry point
    ├── Extensions/                # Foundation helpers
    └── Utils/                     # Colors, font management
```

| Layer      | Responsibility |
|------------|---------------|
| **Models** | Define calculator buttons and operation types as enums |
| **ViewModel** | Manages calculator state, handles input, evaluates expressions via `NSExpression` |
| **Views** | Declarative SwiftUI components with custom shapes and animations |

## Contributing

Contributions are welcome! Here's how to get started:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Ideas for Contributions

- Scientific calculator mode (sin, cos, tan, log)
- Calculation history view
- Haptic feedback on button presses
- iPad-optimized layout
- Home screen widget extension
- Additional calculator themes

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## Author

**Shubham Kumar Singh** — [@Shubham0812](https://github.com/Shubham0812)

<p align="center">
  <a href="https://www.instagram.com/shubham_iosdev/">
    <img src="https://img.shields.io/badge/Instagram-E4405F?style=flat-square&logo=instagram&logoColor=white" alt="Instagram" />
  </a>
  &nbsp;
  <a href="https://www.linkedin.com/in/shubham0812/">
    <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn" />
  </a>
</p>

---

<p align="center">
  If you found this project useful, please consider giving it a star!<br/>
  <a href="https://github.com/Shubham0812/Calculator_UI/stargazers">
    <img src="https://img.shields.io/github/stars/Shubham0812/Calculator_UI?style=social" alt="GitHub Stars" />
  </a>
</p>
