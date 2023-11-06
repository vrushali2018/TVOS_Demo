//
//  ClassifiedCollectionViewCell.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit

class ClassifiedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var type: CellType = .lattestVideos
    
    override func awakeFromNib() {
        containerView.layer.cornerRadius = (containerView.frame.size.height / 2)
        containerView.clipsToBounds = true
        containerView.backgroundColor = .random
        containerView.layer.borderWidth = 10
        containerView.layer.borderColor = UIColor.clear.cgColor
    }
    
    func configureView(text: String) {
        titleLbl.text = text
        containerView.backgroundColor = .random
    }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self {
            containerView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            containerView.layer.borderColor = UIColor.white.cgColor
            titleLbl.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } else {
            containerView.transform = CGAffineTransform(scaleX: 1, y: 1)
            containerView.layer.borderColor = UIColor.clear.cgColor
            titleLbl.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

extension UIColor {
    static var random: UIColor {
        UIColor(red: .random(in: 0.65...1),
                green: .random(in: 0.65...1),
                blue: .random(in: 0.65...1),
                alpha: 0.8)
    }
}
