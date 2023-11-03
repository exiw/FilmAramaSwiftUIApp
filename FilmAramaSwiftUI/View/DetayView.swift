//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Emre Konukpay on 3.11.2023.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack {
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek")
        }.onAppear(perform: {
            self.filmDetayViewModel
                .filmDetayiAl(imdbId : imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
