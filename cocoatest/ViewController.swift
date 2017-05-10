//
//  ViewController.swift
//  cocoatest
//
//  Created by stagiaire on 04/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class ViewController: UITableViewController {

    var _listFilms:[Film] = []
    var recherche:String? = "test"
    
    @IBOutlet weak var ivPoster: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        let settingsButton = UIBarButtonItem(title: "Settings", style: UIBarButtonItemStyle.plain, target: self, action: #selector(displaySettingsView(_:)))
        self.navigationItem.rightBarButtonItem = settingsButton
        
        let query = "http://www.omdbapi.com/"
        let parameters: Parameters = ["s": recherche!]
        Alamofire.request(query, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                if let result = response.result.value as? [String:Any],
                    let main = result["Search"] as? [[String:String]],
                    let reponse = result["Response"] as? String{
                    if(reponse == "True"){
                        for obj in main{
                            self._listFilms.append(Film(title: obj["Title"]!, year: obj["Year"]!, imdbID: obj["imdbID"]!, poster: obj["Poster"]!))
                        }
                        self.tableView.reloadData()
                    }else{
                        //let alert = UIAlertController(title: "Erreur", message: "Pas de films trouvés. Veuillez réessayer.", preferredStyle: UIAlertControllerStyle.alert)
                        //alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                        //self.present(alert, animated: true, completion: nil)
                        //self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    // Affichage formulaire d'ajout de contact
    func displaySettingsView(_ sender: Any){
        if let storyboard = self.storyboard{
            // On va chercher la viewController avec le storyboard_id = "newContact" et on l'affiche
            let destinationController = storyboard.instantiateViewController(withIdentifier: "settingsView")
            self.present(destinationController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let displayAffiches = UserDefaults.standard.bool(forKey: "showAffiches")
        if(displayAffiches){
            //ivPoster.isHidden = false
        }else{
            //ivPoster.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _listFilms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FilmTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "film_cell") as! FilmTableViewCell
        
        let film:Film = _listFilms[indexPath.row]
        cell.display(film: film)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80.0;//Choose your custom row height
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailFilm" {
            if let cell = sender as? UITableViewCell {
                if let indexPath = self.tableView.indexPath(for: cell) {
                    let selectedFilm = _listFilms[indexPath.row]
                    
                    let filmViewController:FilmViewController = segue.destination as! FilmViewController
                    filmViewController._film = selectedFilm
                }
                
            }
        }
    }



}

