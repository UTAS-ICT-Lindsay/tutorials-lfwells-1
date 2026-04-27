//
//  MovieUITableViewCell.swift
//  week9livelecture
//
//  Created by Lindsay Wells on 27/4/2026.
//

import UIKit

class MovieUITableViewCell: UITableViewCell {

    var movie: Movie!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func shareAction(_ sender: Any) {
        print("share")
        
        var shareScreen = UIActivityViewController(activityItems: [movie.title], applicationActivities: nil)
        
        //get the parent view controller
        //ai did this one for me
        if let parentVC = self.window?.rootViewController as? UINavigationController {
            parentVC.present(shareScreen, animated: true, completion: nil)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
