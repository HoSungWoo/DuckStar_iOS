//
//  AnimeViewController.swift
//  DuckStar
//
//  Created by 김호성 on 2025.02.27.
//

import UIKit

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
    private var platformCollectionViewDelegate: CollectionViewDelegate?
    private var platformCollectionViewDataSource: CollectionViewDataSource?
    @IBOutlet weak var platformCollectionViewGestureReceiver: UIView!
    
    @IBOutlet weak var mainTableView: UITableView!
    private var mainTableViewDelegate: TableViewDelegate?
    private var mainTableViewDataSource: TableViewDataSource?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        ratingLabel.text = "4.5"
        titleLabel.text = "나루토 질풍전"
        descriptionLabel.text = "TVA / 2022년도 3분기 / 판타지, 액션"
        storyLabel.text  = "백년이라는 긴 시간 동안 인류와 바깥 세계의 사이를 막아온 벽. 그 벽 너머에는 본 적 없는 세계가 펼쳐져 있었다. 불꽃의 물, 물의 강"
        
        configureTableView()
        configureCollectionView()
        
        
        effectImageView.colors = [.clear, .dsmain.withAlphaComponent(0.8), .dsmaindark]
        effectImageView.locations = [0, 0.6, 1]
        effectImageView.blur = 0
        effectImageView.startPoint = .init(x: 0.5, y: 0)
        effectImageView.endPoint = .init(x: 0.5, y: 1)
        effectImageView.image = UIImage(resource: .naruto)
        
        
    }
    
    private func configure() {
        
        ratingBackgroundView.layer.cornerRadius = 4
    }
    
    private func configureTableView() {
        mainTableViewDelegate = TableViewDelegate(didSelectRowAt: mainTableView(_:didSelectRowAt:), scrollViewDidScroll: mainTableViewScrollViewDidScroll(_:))
        mainTableViewDataSource = TableViewDataSource(numberOfSections: mainTableViewNumberOfSections(in:), numberOfRowsInSection: mainTableView(_:numberOfRowsInSection:), cellForRowAt: mainTableView(_:cellForRowAt:))
        
        mainTableView.delegate = mainTableViewDelegate
        mainTableView.dataSource = mainTableViewDataSource
        
        mainTableView.register(UINib(nibName: String(describing: HeaderTableViewCell.self), bundle: Bundle.presentationLayer), forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        mainTableView.register(UINib(nibName: String(describing: CrewTableViewCell.self), bundle: Bundle.presentationLayer), forCellReuseIdentifier: String(describing: CrewTableViewCell.self))
        mainTableView.register(UINib(nibName: String(describing: CastTableViewCell.self), bundle: Bundle.presentationLayer), forCellReuseIdentifier: String(describing: CastTableViewCell.self))
        
        mainTableView.contentInset.top = -infoViewHeight.constant
    }
    
    private func configureCollectionView() {
        platformCollectionViewGestureReceiver.addGestureRecognizer(platformCollectionView.panGestureRecognizer)
        
        platformCollectionViewDelegate = CollectionViewDelegate(didSelectItemAt: platformCollectionView(_:didSelectItemAt:), sizeForItemAt: platformCollectionView(_:layout:sizeForItemAt:))
        platformCollectionViewDataSource = CollectionViewDataSource(numberOfItemsInSection: platformCollectionView(_:numberOfItemsInSection:), cellForItemAt: platformCollectionView(_:cellForItemAt:))
        
        platformCollectionView.delegate = platformCollectionViewDelegate
        platformCollectionView.dataSource = platformCollectionViewDataSource
        
        platformCollectionView.register(UINib(nibName: String(describing: PlatformCollectionViewCell.self), bundle: Bundle.presentationLayer), forCellWithReuseIdentifier: String(describing: PlatformCollectionViewCell.self))
        
        platformCollectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
    
    @IBAction func onClickBack(_ sender: Any) {
        print("onClickBack")
    }
    
    private enum MainTableViewSection: Int, CaseIterable {
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
                return 10
            case .episode:
                return 10
            case .collection:
                return 10
            case .gallery:
                return 10
            }
        }
    }
    
    private func mainTableViewNumberOfSections(in tableView: UITableView) -> Int {
        return MainTableViewSection.allCases.count
    }
    private func mainTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainTableViewSection(rawValue: section)?.numberOfRows ?? 0
    }
    
    private func mainTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch MainTableViewSection(rawValue: indexPath.section) {
        case .none:
            break
        case .credit:
            switch indexPath.row {
            case 0:
                let cell: HeaderTableViewCell
                if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self), for: indexPath) as? HeaderTableViewCell {
                    cell = reusableCell
                } else {
                    let objectArray = Bundle.presentationLayer.loadNibNamed(String(describing: HeaderTableViewCell.self), owner: nil, options: nil)
                    cell = objectArray!.first! as! HeaderTableViewCell
                }
                cell.titleLabel.text = "제작진 및 성우"
                return cell
            case 1:
                let cell: CrewTableViewCell
                if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CrewTableViewCell.self), for: indexPath) as? CrewTableViewCell {
                    cell = reusableCell
                } else {
                    let objectArray = Bundle.presentationLayer.loadNibNamed(String(describing: CrewTableViewCell.self), owner: nil, options: nil)
                    cell = objectArray!.first! as! CrewTableViewCell
                }
                cell.studioLabel.text = "WIT STUDIO"
                cell.directorLabel.text = "코이즈카 마사시"
                return cell
            case 2:
                let cell: CastTableViewCell
                if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: CastTableViewCell.self), for: indexPath) as? CastTableViewCell {
                    cell = reusableCell
                } else {
                    let objectArray = Bundle.presentationLayer.loadNibNamed(String(describing: CastTableViewCell.self), owner: nil, options: nil)
                    cell = objectArray!.first! as! CastTableViewCell
                }
                
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
    
    private func mainTableViewScrollViewDidScroll(_ scrollView: UIScrollView) {
        
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
    private func mainTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch MainTableViewSection(rawValue: indexPath.section) {
        case .none:
            break
        case .credit:
            switch indexPath.row {
            case 0:
                guard let viewControllerFactory = (navigationController as? DINavigationController)?.viewControllerFactory else { return }
                let creditViewController = viewControllerFactory.createCreditViewController()
                navigationController?.pushViewController(creditViewController, animated: true)
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
    }
    
    private func platformCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    private func platformCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    private func platformCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = collectionView.bounds.height
        return CGSize(width: size, height: size)
    }
    
    private func platformCollectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
