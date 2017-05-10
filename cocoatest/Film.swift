//
//  Films.swift
//  cocoatest
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

class Film {
    
    var title:String
    var year:String
    var imdbID:String
    var poster:String
    var imdbRating:String
    var runtime:String
    var director:String
    var languages:String
    var plot:String
    //var released:String
    //var genre:String
    //var writer:String
    //var actors:String
    //var awards:String
    //var ratings:String
    
    init(title:String, year:String, imdbID:String, poster:String) {
        self.title = title
        self.imdbID = imdbID
        self.plot = ""
        self.poster = poster
        self.imdbRating = ""
        self.director = ""
        self.year = year
        self.languages = ""
        self.runtime = ""
    }
    
    init(title:String, plot: String, poster: String, year: String, runtime: String, director: String, imdbRating: String, languages: String, imdbID: String){
        self.imdbID = imdbID
        self.title = title
        self.plot = plot
        self.poster = poster
        self.imdbRating = imdbRating
        self.director = director
        self.year = year
        self.languages = languages
        self.runtime = runtime
    }
    
}
