//
//  FilmTableViewCell.swift
//  cocoatest
//
//  Created by stagiaire on 05/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lTitle: UILabel!
    @IBOutlet weak var lPlot: UILabel!
    @IBOutlet weak var ivPoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func display(film:Film) {
        lTitle.text = film.title
        
        let url = URL(string: film.poster)
        if(film.poster != "N/A"){
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            ivPoster.image = UIImage(data: data!)
        }
    }
    
}
