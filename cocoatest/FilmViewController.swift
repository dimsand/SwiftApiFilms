//
//  FilmViewController.swift
//  cocoatest
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire

class FilmViewController: UIViewController {
    
    
    @IBOutlet weak var lTitle: UILabel!
    @IBOutlet weak var lPlot: UILabel!
    
    var _film:Film?
    
    var film_detail:Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // API : renvoi les détails en fonction du imdbID du film sélectionné
        let imdbID = _film?.imdbID
        //let query_full = "http://www.omdbapi.com/?i=\(imdbID!)"
        let query = "http://www.omdbapi.com/"
        let parameters: Parameters = ["i": _film?.imdbID ?? ""]
        print(query)
        print(parameters)
        Alamofire.request(query, parameters: parameters).responseJSON { response in
            print(response.result)
            if response.result.isSuccess {
                print(response.request)  // original URL request
                print(response.response) // HTTP URL response
                print(response.data)     // server data
                print(response.result.value)   // result of response serialization
                let result = response.result.value as? [String:String]!
                    print(result)
                    //self.film_detail = Film(title: result?["Title"]!, plot: result["Plot"]!, poster: result["Poster"]!, year: result["Year"]!, runtime: result["Runtime"]!, director: result["Director"]!, imdbRating: result["imdbRating"]!, languages: result["Language"]!, imdbID: result["imdbID"]!)
                    self.lTitle.text = result?["Title"]!
                    self.lPlot.text = result?["Plot"]!
                
            }
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
