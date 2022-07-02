//
//  detailsVC.swift
//  movieAPP
//
//  Created by AMN on 3/30/22.
//

import UIKit

class detailsVC: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var popularityLbl: UILabel!
    @IBOutlet weak var lowerVotesNumberLbl: UILabel!
    @IBOutlet weak var overViewLbl: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var votingNumberLbl: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var filmPoster: RoundedImage!
    @IBOutlet weak var backPoster: RoundedImage!
    var filmdetails : Result?
    var pooster : String = ""
    var backPooster : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup(){
        guard let urlposter = URL(string: (NetworkConstants.shared.imageBaseURL)+(filmdetails?.posterPath ?? ""))else {
            return}
        print(urlposter)
        DispatchQueue.global().async { [weak self] in
            if let data = try?Data(contentsOf: urlposter){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.filmPoster.image = image
                    }
                }
            }}
        guard let urlback = URL(string: (NetworkConstants.shared.imageBaseURL)+(filmdetails?.backdropPath ?? ""))else {
            return}
        print("urlback=\(urlback)")
        DispatchQueue.global().async { [weak self] in
            if let data = try?Data(contentsOf: urlback){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.backPoster.image = image
                    }
                }
            }
        }
        backBtn.addTarget(self, action: #selector(backToMainVC), for: .allEvents)
        navigationController?.isNavigationBarHidden = true
        votingNumberLbl.text = "\(filmdetails?.voteCount ?? 0)"
        lowerVotesNumberLbl.text  = "\(filmdetails?.voteCount ?? 0)"
        popularityLbl.text = "\(filmdetails?.popularity ?? 0)"
        overViewLbl.text = "\(filmdetails?.overview ?? "")"
        movieLanguage.text = "\(filmdetails?.originalLanguage ?? "")"
        switch ceil((filmdetails?.voteAverage ?? 0) / 2){
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
    @objc func backToMainVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
