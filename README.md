# 📖 Blog Explorer


A fully functional **Blog Explorer App** built with Flutter! This app allows users to browse blogs, view details, like their favorite entries, and save blogs locally for offline access.

---

## 📱 **Features**

- **Fetch Blogs**: Retrieve blog data from a remote API.
- **View Blog Details**: Access detailed blog information with images and titles.
- **Like Blogs**: Mark blogs as liked and view them in a dedicated "Liked Blogs" section.
- **Offline Support**: Cached blogs are stored locally using Hive for offline access.
- **Dynamic UI Updates**: Reflect user actions like liking/unliking in real time.

---

## 🛠 **Tech Stack**

- **Flutter**: Framework for building natively compiled apps.
- **flutter_bloc**: State management for managing UI state dynamically.
- **Hive**: Lightweight local database for caching and offline functionality.
- **cached_network_image**: Efficient image loading with caching support.
- **HTTP**: Make network requests to fetch blog data.

---

## 📂 **Project Structure**

```plaintext
lib/
├── main.dart               # App entry point
├── bloc/                   # State management
│   ├── blog_bloc.dart      # Bloc for blog-related logic
│   ├── blog_event.dart     # Events for blog actions
│   └── blog_state.dart     # States representing UI changes
├── models/                 # Data models
│   ├── blog_model.dart     # Blog data structure
│   └── blog_model.g.dart   # Generated Hive adapter
├── screens/                # Screens
│   ├── blog_list_screen.dart      # List of blogs
│   ├── blog_detail_screen.dart    # Blog detail view
│   └── liked_blogs_screen.dart    # List of liked blogs
├── services/               # Services for API and local data
│   └── api_service.dart    # Handles API calls and caching
├── widgets/                # Reusable UI components
│   └── blog_list_item.dart # Blog list item widget
└── assets/                 # Images and other assets
