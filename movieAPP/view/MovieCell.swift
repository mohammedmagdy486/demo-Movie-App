//
//  MovieCell.swift
//  movieAPP
//
//  Created by AMN on 3/27/22.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var filmImage: RoundedImage!
    
    @IBOutlet weak var cellView: RoundedView!
    @IBOutlet weak var votesNumberLbl: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var overViewLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var filmTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateCell (data: Result){
        filmTitleLbl.text = data.originalTitle
        authorLbl.text = "Author"
        overViewLbl.text = data.overview
        votesNumberLbl.text = "\(data.voteCount ?? 0)"
        guard let url = URL(string: (NetworkConstants.shared.imageBaseURL)+(data.posterPath ?? ""))else {
            return}
        DispatchQueue.global().async { [weak self] in
            if let data = try?Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.filmImage.image = image
                    }
                }
            }
        }
        switch ceil((data.voteAverage ?? 0) / 2){
        case 1.0 :
            return ratingImage.image = UIImage(named: "1")
        case 2.0 :
            return  ratingImage.image = UIImage(named: "2")
        case 3.0 :
            return ratingImage.image = UIImage(named: "3")
        case 4.0 :
            return ratingImage.image = UIImage(named: "4")
        case 5.0 :
            return  ratingImage.image = UIImage(named: "5")
        default:
            return ratingImage.image = UIImage(named: "0")
        }
    }

}
