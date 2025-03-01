//
//  AnimeViewController.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

class AnimeViewController: UIViewController {
    
    @IBOutlet weak var topBackgroundImageView: UIImageView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(UINib(nibName: String(describing: RatingTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RatingTableViewCell.self))
        mainTableView.contentInset.top = 152
    }
}

extension AnimeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RatingTableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: RatingTableViewCell.self), for: indexPath) as? RatingTableViewCell {
            cell = reusableCell
        } else {
            let objectArray = Bundle.main.loadNibNamed(String(describing: RatingTableViewCell.self), owner: nil, options: nil)
            cell = objectArray![0] as! RatingTableViewCell
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}
