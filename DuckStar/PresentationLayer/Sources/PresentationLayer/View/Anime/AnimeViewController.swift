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
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var platformCollectionView: UICollectionView!
    @IBOutlet weak var platformCollectionViewGestureReceiver: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: String(describing: HeaderTableViewCell.self), bundle: Bundle.presentationLayer), forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        mainTableView.contentInset.top = -topViewHeight.constant
//        topView.addGestureRecognizer(mainTableView.panGestureRecognizer)
        platformCollectionViewGestureReceiver.addGestureRecognizer(platformCollectionView.panGestureRecognizer)
        
//        posterImageView.image = UIImage(resource: .naruto)
//        posterImageView.layer.cornerRadius = 4
//        posterView.layer.shadowPath = UIBezierPath(roundedRect: posterView.bounds, cornerRadius: posterImageView.layer.cornerRadius).cgPath
//        posterView.layer.shadowColor = UIColor.black.cgColor
//        posterView.layer.shadowRadius = 4
//        posterView.layer.shadowOpacity = 1
//        posterView.layer.shadowOffset = .zero
        
        effectImageView.colors = [.clear, .main.withAlphaComponent(0.8), .maindark]
        effectImageView.locations = [0, 0.6, 1]
        effectImageView.blur = 0
        effectImageView.startPoint = .init(x: 0.5, y: 0)
        effectImageView.endPoint = .init(x: 0.5, y: 1)
        effectImageView.image = UIImage(resource: .naruto)
        
        platformCollectionView.register(UINib(nibName: String(describing: PlatformCollectionViewCell.self), bundle: Bundle.presentationLayer), forCellWithReuseIdentifier: String(describing: PlatformCollectionViewCell.self))
        platformCollectionView.delegate = self
        platformCollectionView.dataSource = self
        platformCollectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
//        platformCollectionView.addGestureRecognizer(mainTableView.panGestureRecognizer)
//        view.bringSubviewToFront(platformCollectionView)
    }
    @IBAction func onClickBack(_ sender: Any) {
        print("onClickBack")
    }
}

extension AnimeViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HeaderTableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as? HeaderTableViewCell {
            cell = reusableCell
        } else {
            let objectArray = Bundle.main.loadNibNamed(String(describing: HeaderTableViewCell.self), owner: nil, options: nil)
            cell = objectArray![0] as! HeaderTableViewCell
        }
        return cell
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // platformCollectionView에서 Call되는 것 막기
        guard let tableView = scrollView as? UITableView else { return }
        
        // nav 상태 변경
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
        
        topView.alpha = -scrollView.contentOffset.y / (mainTableView.contentInset.top/2)
        
        if topView.alpha > 0 {
            topViewHeight.constant = scrollView.contentOffset.y
        }
//        if topView.alpha > 0 {
//            let scrollDecelerationPoint: CGFloat = tableView.contentInset.top/3
//            let scrollDecelerationRate: CGFloat = 4
//            if -scrollView.contentOffset.y < scrollDecelerationPoint {
//                topViewHeight.constant = -scrollDecelerationPoint + (scrollView.contentOffset.y + scrollDecelerationPoint) / scrollDecelerationRate
//            } else {
//                topViewHeight.constant = scrollView.contentOffset.y
//            }
//        }
        
        
    }
}

extension AnimeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlatformCollectionViewCell
        if let reusableCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlatformCollectionViewCell.self), for: indexPath) as? PlatformCollectionViewCell {
            cell = reusableCell
        } else {
            let objectArray = Bundle.presentationLayer.loadNibNamed(String(describing: PlatformCollectionViewCell.self), owner: nil, options: nil)
            cell = objectArray![0] as! PlatformCollectionViewCell
        }
        cell.mainImageView.layer.cornerRadius = collectionView.bounds.height / 2
        cell.mainView.layer.cornerRadius = collectionView.bounds.height / 2
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = collectionView.bounds.height
        return CGSize(width: size, height: size)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
