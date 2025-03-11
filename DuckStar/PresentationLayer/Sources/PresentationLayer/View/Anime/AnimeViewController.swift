//
//  AnimeViewController.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit
import EffectImageView

public class AnimeViewController: UIViewController {
    
    @IBOutlet weak var effectImageView: EffectImageView!
    
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var navBackButton: UIButton!
    
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var posterView: UIView!
    @IBOutlet weak var platformCollectionView: UICollectionView!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        mainTableView.register(UINib(nibName: String(describing: RatingTableViewCell.self), bundle: Bundle.presentationLayer), forCellReuseIdentifier: String(describing: RatingTableViewCell.self))
        mainTableView.contentInset.top = topView.bounds.height
        
//        posterImageView.layer.cornerRadius = 8
        posterView.layer.shadowPath = UIBezierPath(roundedRect: posterView.bounds, cornerRadius: posterImageView.layer.cornerRadius).cgPath
        posterView.layer.shadowColor = UIColor.black.cgColor
//        posterView.layer.shadowRadius = 8
        posterView.layer.shadowOpacity = 1
        posterView.layer.shadowOffset = .zero
        posterImageView.image = UIImage(resource: .naruto)
        print(posterImageView.image)
    }
}

extension AnimeViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RatingTableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: RatingTableViewCell.self), for: indexPath) as? RatingTableViewCell {
            cell = reusableCell
        } else {
            let objectArray = Bundle.main.loadNibNamed(String(describing: RatingTableViewCell.self), owner: nil, options: nil)
            cell = objectArray![0] as! RatingTableViewCell
        }
        return cell
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newConstraints = -(mainTableView.contentInset.top + scrollView.contentOffset.y)
        if navView.isHidden && scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.navView.isHidden = false
                self?.statusBarView.backgroundColor = .systemBackground
                self?.navBackButton.tintColor = .label
            })
        }
        if !navView.isHidden && scrollView.contentOffset.y < 0 {
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.navView.isHidden = true
                self?.statusBarView.backgroundColor = .clear
                self?.navBackButton.tintColor = .white
            })
        }
        print(newConstraints)
        if newConstraints >= 0 {
            topConstraints.constant = newConstraints
            // 확대
        } else {
            topConstraints.constant = newConstraints / 4
        }
        topView.alpha = -scrollView.contentOffset.y / mainTableView.contentInset.top
    }
}
