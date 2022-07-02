//
//  ViewController.swift
//  movieAPP
//
//  Created by AMN on 3/27/22.
//

import UIKit
import Alamofire
class mainVC: UIViewController {
    
    @IBOutlet weak var filmsTableView: UITableView!
    
    var items: [Result] = []
    var isFetching = true
    var totalpages = 0
    var Pages = 0
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        fetchFilms(key: NetworkConstants.shared.key, page: currentPage)
        // Do any additional setup after loading the view.
    }
}
    
extension mainVC: UITableViewDelegate, UITableViewDataSource{
    func fetchFilms(key: String, page: Int) {
    // 1
        let film = AuthEndPoints.getFilms(apiKey: key, page: page)
        let url = ("\(NetworkConstants.shared.baseURL)")
        AF.request(url, method: film.HTTPMethod,parameters: film.parameters, encoding: film.encoding, headers: film.headers)
      .validate()
      .responseDecodable(of: FilmsModel.self) { (response) in
        guard let films = response.value else { return }
          self.items.append(contentsOf: films.results ?? [])
          self.totalpages =  films.totalPages ?? 0
          self.filmsTableView.reloadData()
      }
  }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let item = items[indexPath.row]
        cell.updateCell(data: item)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1{
            if  currentPage < totalpages {
                currentPage += 1
                fetchFilms(key: NetworkConstants.shared.key, page: currentPage)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! detailsVC
        vc.filmdetails = items[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
}
