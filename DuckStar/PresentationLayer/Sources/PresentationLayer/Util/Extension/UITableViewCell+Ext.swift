//
//  UITableViewCell+Ext.swift
//  PresentationLayer
//
//  Created by 김호성 on 2025.03.31.
//

import Foundation
import UIKit

extension UITableViewCell {
    class func create<T: UITableViewCell>(tableView: UITableView, indexPath: IndexPath) -> T {
        let cell: T
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T {
            cell = reusableCell
        } else {
            let objectArray = Bundle.presentationLayer.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
            cell = objectArray!.first! as! T
        }
        return cell
    }
}
