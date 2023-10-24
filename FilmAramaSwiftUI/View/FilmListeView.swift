//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Emre Konukpay on 29.08.2023.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    @State var aranacakFilm = ""
    
    init(){
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged:{ _ in }, onCommit: {
                        self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm)
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler, id: \.imdbId){ filmm in
                    HStack(alignment: .top) {
                        OzelImage(url: filmm.poster)
                            .frame(width: 100,height: 150)
                        VStack{
                            Text(filmm.title)
                                .font(.title3)
                                .foregroundColor(.blue)
                            
                            
                            Text(filmm.year)
                                .foregroundColor(.orange)
                        }
                    }
                }.navigationTitle(Text("Film Kitabı"))

            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        FilmListeView()
        
    }
}
