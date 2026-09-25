# Eigi TravelMate

Eigi TravelMate is a Flutter travel companion app built to help visitors explore Manipur with confidence. It combines destination discovery, AI-powered travel guidance, local language translation, and trip planning support in one mobile experience.

## Overview

The app is designed for tourists and travelers looking for quick, useful information about Manipur including:

- Popular destinations and attractions
- Local culture and travel highlights
- AI-assisted tourism guidance
- Translation support for English and local language use cases
- Travel planning assistance for itinerary-related questions

## Key Features

- Explore the beauty of Manipur through curated tourism content
- Ask Eigi AI questions about destinations, local experiences, and travel help
- Use the built-in translator flow for language support
- Browse travel information backed by local tourism data
- Plan trips with app-driven suggestions and traveler-friendly recommendations

## Tech Stack

- Flutter + Dart
- Material 3 UI
- Local tourism knowledge data via JSON assets
- Ollama-powered AI assistant integration
- Speech and audio support for voice-driven experiences

## Project Structure

- `lib/` — app screens and business logic
- `lib/services/` — AI, retrieval, and external service integrations
- `assets/data/manipur_tourism.json` — tourism knowledge base
- `assets/images/` — app artwork and icons

## Prerequisites

Before running the app, make sure you have:

- Flutter SDK 3.12.0 or newer
- Android Studio or Xcode for emulator/device support
- A connected Android/iOS device or emulator
- An Ollama instance running locally if you want the AI assistant to respond

## Local AI Setup

The AI assistant is configured in `lib/services/ai_service.dart`.

Important:

- The app currently points to a local Ollama URL such as `http://172.20.10.9:11434`
- Update the `ollamaUrl` to your machine's correct local IP if needed
- The model in use is `qwen3:8b`

If Ollama is not running, the assistant will return a friendly connection error instead of crashing.

## Getting Started

1. Clone the repository
2. Navigate to the project root
3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Build for Android

```bash
flutter build apk
```

## Notes

The app uses local tourism data stored in `assets/data/manipur_tourism.json` to ground responses and support destination-related queries in a more relevant way.

## License

This project is currently unlicensed unless stated otherwise in a separate project policy.
