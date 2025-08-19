# ImaginAI 🎨

A modern iOS application built with SwiftUI that generates AI-powered images from text descriptions using the Hugging Face API. ImaginAI transforms your imagination into visual reality through advanced machine learning models.

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0+-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

- **🤖 AI-Powered Image Generation**: Create unique images from text descriptions using the FLUX.1-dev model
- **📱 Modern SwiftUI Interface**: Clean, intuitive user experience with native iOS design patterns
- **🖼️ Image History**: Browse and manage previously generated images
- **💾 Save to Photos**: One-tap save functionality for generated images
- **⚡ Real-time Generation**: Live progress indicators and status updates
- **🎯 Detail View**: Full-screen image viewing with tap-to-save functionality
- **🔄 Smart State Management**: Efficient handling of loading states and error conditions

## 🛠️ Technical Stack

- **Framework**: SwiftUI 3.0+
- **Language**: Swift 5.9
- **Target**: iOS 15.0+
- **API**: Hugging Face Inference API
- **Architecture**: MVVM with async/await patterns
- **Image Processing**: UIKit integration for image handling

## 📱 Screenshots

*[Screenshots would be added here]*

## 🚀 Getting Started

### Prerequisites

- Xcode 15.0 or later
- iOS 15.0+ device or simulator
- Active internet connection for API calls

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/abrahao-dev/imaginAI.git
   cd imaginAI
   ```

2. **Open in Xcode**
   ```bash
   open ImaginAI.xcodeproj
   ```

3. **Build and Run**
   - Select your target device or simulator
   - Press `Cmd + R` or click the Run button
   - The app will launch and be ready to generate images

### API Configuration

The app uses the Hugging Face Inference API with the FLUX.1-dev model. The API key is currently embedded in the code for demonstration purposes. For production use, consider:

- Moving the API key to a secure configuration file
- Implementing proper key management
- Adding rate limiting and error handling

## 🎯 Usage

1. **Enter Description**: Type a detailed description of the image you want to generate
   - Example: "A futuristic cityscape with flying cars and neon lights"
   - Maximum 200 characters for optimal results

2. **Generate Image**: Tap "Gerar Imagem" to start the generation process
   - Generation typically takes 30 seconds to 2 minutes
   - Progress indicator shows current status

3. **View Results**: The generated image appears with options to:
   - Save to photo album (tap the image)
   - View in detail view (tap images in history)
   - Generate new images (confirmation dialog prevents accidental overwrites)

4. **Browse History**: Scroll through previously generated images in the horizontal gallery

## 🏗️ Project Structure

```
ImaginAI/
├── ImaginAIApp.swift          # App entry point
├── ContentView.swift          # Main UI and business logic
├── ImageGeneratorService.swift # API service layer
├── Assets.xcassets/          # App icons and colors
└── Info.plist               # App configuration
```

### Key Components

- **`ContentView`**: Main SwiftUI view with MVVM architecture
- **`ImageGeneratorService`**: Handles API communication and image processing
- **`ImageSaver`**: Manages photo album integration
- **`ImageDetailView`**: Full-screen image viewing component

## 🔧 Architecture Highlights

### MVVM Pattern
- **Model**: Image data and API responses
- **View**: SwiftUI views with reactive UI updates
- **ViewModel**: State management in ContentView

### Async/Await Integration
- Modern concurrency patterns for API calls
- Proper error handling and user feedback
- Background processing with UI updates

### SwiftUI Best Practices
- Reactive state management with `@State` properties
- Proper view composition and reusability
- Native iOS design patterns and accessibility

## 🚨 Error Handling

The app implements comprehensive error handling:

- **Network Errors**: Connection issues and API failures
- **Input Validation**: Empty descriptions and character limits
- **Image Processing**: Data conversion and format issues
- **User Feedback**: Clear error messages and recovery options

## 📊 Performance Considerations

- **Image Caching**: Generated images stored in memory for quick access
- **API Optimization**: Efficient request handling with proper timeouts
- **Memory Management**: Automatic cleanup of large image data
- **UI Responsiveness**: Background processing with loading indicators

## 🔒 Security Notes

- API key is currently embedded in source code (demo purposes only)
- No sensitive data is stored locally
- Network requests use HTTPS
- Input sanitization prevents injection attacks

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add amazing feature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Open a Pull Request**

### Development Guidelines

- Follow Swift style guidelines
- Add comments for complex logic
- Test on multiple iOS versions
- Ensure accessibility compliance

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**Matheus Abrahão**  
- GitHub: [@abrahao-dev](https://github.com/abrahao-dev)  
- LinkedIn: [linkedin.com/in/matheusabrahao](https://www.linkedin.com/in/matheusabrahao)  
- Portfolio: [matheusabrahao.com.br](https://www.matheusabrahao.com.br)  

## 🙏 Acknowledgments

- [Hugging Face](https://huggingface.co/) for providing the FLUX.1-dev model
- [SwiftUI](https://developer.apple.com/xcode/swiftui/) for the modern UI framework
- [Apple Developer Documentation](https://developer.apple.com/documentation/) for comprehensive guides

## 📈 Future Enhancements

- [ ] User authentication and cloud sync
- [ ] Multiple AI model support
- [ ] Image editing and filters
- [ ] Social sharing features
- [ ] Offline mode with cached images
- [ ] Advanced prompt templates
- [ ] Batch image generation
- [ ] Custom model fine-tuning

---

⭐ **Star this repository if you found it helpful!**
