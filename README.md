# GitHub Followers App 📱🐙

An elegant iOS app built with **UIKit**, allowing users to search for GitHub users and view their followers. The app leverages the GitHub REST API and follows modern development best practices, including programmatic UI and modular architecture.
This is a take-home project done by following Sean Allen's "iOS Dev Job Interview Practice - Take Home Project - Updated for iOS 17" project.

---

## 📸 Features

- 🔍 **Search Users** by GitHub username
- 👥 **View Followers** list with infinite scrolling
- 📂 **Profile Detail** screen with GitHub stats
- ❤️ **Favorites** users for quick access
- 🎨 Fully **programmatic UI** (no storyboards)
- 🌙 Supports **Dark Mode**
- ✅ Input validation and graceful error handling

---

## 📐 Architecture

- Programmatic UIKit
- MVC (with hints of MVVM preparation)
- SceneDelegate-based window management (no storyboard)
- URLSession-based networking with `Result<T, GFError>`
- `Codable` for API model decoding
- Custom reusable UI components

---

## 🔧 Requirements

- iOS 15.0+
- Xcode 15+
- Swift 5.9+

---

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/your-username/github-followers.git
