//
//  NetworkService.swift
//  RutubIos
//
//  Created by Kalandarov Vakil on 21.04.2022.
//

import Foundation

class NetworkService {
    
    func request(text: String, compliteon: @escaping (Result<Model, Error>) -> Void) {
        guard let url = URL(string: "https://rutube.ru/api/search/video/?query=\(text)") else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                compliteon(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let text = try JSONDecoder().decode(Model.self, from: data)
                compliteon(.success(text))
            }catch let jsonError {
                print("Failed to decode", jsonError)
                compliteon(.failure(jsonError))
            }
        }.resume()
    }
    
    func requestVideo(id: String, compliteon: @escaping (Result<ModelVideo, Error>) -> Void) {
        guard let url = URL(string: "https://rutube.ru/api/video/\(id)/") else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                compliteon(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let text = try JSONDecoder().decode(ModelVideo.self, from: data)
                compliteon(.success(text))
            } catch let jsonError {
                print("Failed to decode", jsonError)
                compliteon(.failure(jsonError))
            }
        }.resume()
    }
}
