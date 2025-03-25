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
    @IBOutlet weak var infoViewHeight: NSLayoutConstraint!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var ratingBackgroundView: UIView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var platformCollectionView: UICollectionView!
    @IBOutlet weak var platformCollectionViewGestureReceiver: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        ratingLabel.text = "4.5"
        titleLabel.text = "나루토 질풍전"
        descriptionLabel.text = "TVA / 2022년도 3분기 / 판타지, 액션"
        storyLabel.text  = "백년이라는 긴 시간 동안 인류와 바깥 세계의 사이를 막아온 벽. 그 벽 너머에는 본 적 없는 세계가 펼쳐져 있었다. 불꽃의 물, 물의 강"
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: String(describing: HeaderTableViewCell.self), bundle: Bundle.presentationLayer), forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        mainTableView.contentInset.top = -infoViewHeight.constant
        platformCollectionViewGestureReceiver.addGestureRecognizer(platformCollectionView.panGestureRecognizer)
        
        effectImageView.colors = [.clear, .dsmain.withAlphaComponent(0.8), .dsmaindark]
        effectImageView.locations = [0, 0.6, 1]
        effectImageView.blur = 0
        effectImageView.startPoint = .init(x: 0.5, y: 0)
        effectImageView.endPoint = .init(x: 0.5, y: 1)
        effectImageView.image = UIImage(resource: .naruto)
        
        platformCollectionView.register(UINib(nibName: String(describing: PlatformCollectionViewCell.self), bundle: Bundle.presentationLayer), forCellWithReuseIdentifier: String(describing: PlatformCollectionViewCell.self))
        platformCollectionView.delegate = self
        platformCollectionView.dataSource = self
        platformCollectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    private func configure() {
        starImageView.image = UIImage(resource: .dsstar).withTintColor(.dsmain)
        
        ratingLabel.textColor = .dswhite
        titleLabel.textColor = .dswhite
        descriptionLabel.textColor = .dsgray4
        storyLabel.textColor = .dsgray4
        
        ratingBackgroundView.layer.cornerRadius = 4
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        print("onClickBack")
    }
}

extension AnimeViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Section: Int, CaseIterable {
        case credit = 0
        case myRating
        case rating
        case episode
        case collection
        case gallery
        
        var numberOfRows: Int {
            switch self {
            case .credit:
                return 3
            case .myRating:
                return 2
            case .rating:
                return 0
            case .episode:
                return 0
            case .collection:
                return 0
            case .gallery:
                return 0
            }
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Section(rawValue: section)?.numberOfRows ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .none:
            break
        case .credit:
            switch indexPath.row {
            case 0:
                let cell: HeaderTableViewCell
                if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as? HeaderTableViewCell {
                    cell = reusableCell
                } else {
                    let objectArray = Bundle.main.loadNibNamed(String(describing: HeaderTableViewCell.self), owner: nil, options: nil)
                    cell = objectArray![0] as! HeaderTableViewCell
                }
                cell.titleLabel.text = "제작진 및 성우"
                return cell
            default:
                break
            }
        case .myRating:
            break
        case .rating:
            break
        case .episode:
            break
        case .collection:
            break
        case .gallery:
            break
        }
        return UITableViewCell()
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
        
        infoView.alpha = -scrollView.contentOffset.y / (mainTableView.contentInset.top/2)
        
        if infoView.alpha > 0 {
            infoViewHeight.constant = scrollView.contentOffset.y
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
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
