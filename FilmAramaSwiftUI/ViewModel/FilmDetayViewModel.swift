//
//  FilmDetayViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Emre Konukpay on 3.11.2023.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
 
    let dowmloaderClient = DownloaderClient()
    
    func filmDetayiAl (imdbId : String) {
        dowmloaderClient.filmDetayiniIndir(imdbId: imdbId) { sonuc in
            switch sonuc{
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
            }
        }
    }
    
}


struct FilmDetaylariViewModel {
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    
    var imdbId : String {
        detay.imdbId
    }
    
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var awards : String {
        detay.awards
    }
    
    var plot : String {
        detay.plot
    }
    
}
