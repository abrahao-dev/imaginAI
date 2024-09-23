import SwiftUI
import UIKit

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var generatedImage: UIImage? = nil
    @State private var imageHistory: [UIImage] = []
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    @State private var showAlert: Bool = false
    @State private var imageSaver = ImageSaver()
    @State private var showImageDetail: Bool = false
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        ScrollView {
            VStack {
                Text("ImaginAI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                TextField("Digite uma descrição (Ex: Astronaut riding a horse)", text: $userInput)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .disabled(isLoading)

                Button(action: {
                    if generatedImage != nil {
                        showAlert = true
                    } else {
                        generateImage(from: userInput)
                    }
                }) {
                    Text(isLoading ? "Gerando Imagem..." : "Gerar Imagem")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isLoading ? Color.gray : Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(isLoading)

                if isLoading {
                    VStack {
                        ProgressView()
                            .padding()
                        Text("Por favor, aguarde enquanto geramos a imagem. Isso pode levar de 30 segundos a 2 minutos.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }

                if let image = generatedImage {
                    withAnimation {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding()
                            .border(Color.gray, width: 1)
                            .shadow(radius: 10)
                            .onTapGesture {
                                imageSaver.writeToPhotoAlbum(image: image)
                            }
                    }
                }

                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }

                if !imageHistory.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Histórico de Imagens")
                            .font(.headline)
                            .padding(.top)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(imageHistory, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding(4)
                                        .border(Color.gray, width: 1)
                                        .shadow(radius: 5)
                                        .onTapGesture {
                                            selectedImage = image
                                            showImageDetail = true
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Confirmar"),
                    message: Text("Você realmente deseja apagar sua imagem anterior e gerar uma nova?"),
                    primaryButton: .destructive(Text("Sim")) {
                        if let image = generatedImage {
                            imageHistory.append(image)
                        }
                        generatedImage = nil
                        generateImage(from: userInput)
                    },
                    secondaryButton: .cancel()
                )
            }
            .sheet(isPresented: $showImageDetail) {
                if let selectedImage = selectedImage {
                    ImageDetailView(image: selectedImage)
                }
            }
        }
    }

    func generateImage(from text: String) {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Por favor, insira uma descrição."
            return
        }
        
        let limitedText = String(text.prefix(200))
        
        isLoading = true
        errorMessage = nil

        ImageGeneratorService.generateImage(from: limitedText) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let image):
                    self.generatedImage = image
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImageDetailView: View {
    var image: UIImage

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
        }
    }
}

import UIKit

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Error saving photo: \(error.localizedDescription)")
        } else {
            print("Successfully saved photo.")
        }
    }
}
