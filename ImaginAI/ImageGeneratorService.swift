//
//  ImageGeneratorService.swift
//  ImaginAI
//
//  Created by Matheus Abrahao on 23/09/24.
//

import Foundation
import UIKit

class ImageGeneratorService {
    static func generateImage(from text: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let apiKey = "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"
        let modelURL = "https://api-inference.huggingface.co/models/black-forest-labs/FLUX.1-dev"
        
        guard let url = URL(string: modelURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "inputs": text
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Erro: Status code \(httpResponse.statusCode)"])
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Erro: sem dados na resposta"])
                completion(.failure(error))
                return
            }
            
            if let image = UIImage(data: data) {
                completion(.success(image))
            } else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Erro: Não foi possível converter os dados em uma imagem"])
                completion(.failure(error))
            }
        }.resume()
    }
}
