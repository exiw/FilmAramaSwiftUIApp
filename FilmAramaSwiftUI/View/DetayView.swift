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
        ScrollView {
            VStack(alignment: .leading, spacing:5) {
                HStack{
                    Spacer()
                    OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "").frame(width: UIScreen.main.bounds.height*0.3,height: UIScreen.main.bounds.height * 0.5,alignment: .center)
                    Spacer()
                }
                
                
                Text(filmDetayViewModel.filmDetayi?.title ?? "Film Ismi Gösterilecek").font(.title).padding()
                
                Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil).padding()
                
                Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
                
                Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding().fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                
                Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödül Gösterilecek")").padding().fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                
                Text("Çıkış Yılı \(filmDetayViewModel.filmDetayi?.year ?? "Çıkış Yılı Göstericek")").padding()
                Spacer()
                
            }.onAppear(perform: {
                self.filmDetayViewModel
                    .filmDetayiAl(imdbId : imdbId)
            })
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
