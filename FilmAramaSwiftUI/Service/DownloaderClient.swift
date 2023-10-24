//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Emre Konukpay on 30.08.2023.
//

import Foundation

class DownloaderClient {
    func filmleriIndir(search: String,completion: @escaping (Result<[Film]?,DowloaderError>) -> Void){
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=a6b97fd6") else{
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi  = try? JSONDecoder().decode(GelenFilmeler.self, from: data)
            else{
                return completion(.failure(.veriIslemedi))
            }
            
            completion(.success(filmCevabi.filmler))
            
        }.resume()
        
    }
}

enum DowloaderError : Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslemedi
}
