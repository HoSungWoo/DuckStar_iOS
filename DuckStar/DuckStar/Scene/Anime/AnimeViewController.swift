//
//  AnimeViewController.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

class AnimeViewController: UIViewController {
    
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var navBackButton: UIButton!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageView: BackgroundImageView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var topView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(UINib(nibName: String(describing: RatingTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RatingTableViewCell.self))
        mainTableView.contentInset.top = topView.bounds.height
    }
}

extension AnimeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
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
        let newConstraints = -(mainTableView.contentInset.top + scrollView.contentOffset.y)
        if navLabel.alpha == 0 && scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.navLabel.alpha = 1
                self?.statusBarView.backgroundColor = .systemBackground
                self?.navBackButton.tintColor = .label
            })
        }
        if navLabel.alpha == 1 && scrollView.contentOffset.y < 0 {
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.navLabel.alpha = 0
                self?.statusBarView.backgroundColor = .clear
                self?.navBackButton.tintColor = .white
            })
        }
        topConstraints.constant = newConstraints / 4
        topView.alpha = -scrollView.contentOffset.y / mainTableView.contentInset.top
    }
}
