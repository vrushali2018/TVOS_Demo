//
//  VideosCollectionViewCell.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImgView: UIImageView!
    
    var type: CellType = .lattestVideos
     
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImgView.layer.cornerRadius = 20
        posterImgView.clipsToBounds = true
        posterImgView.layer.borderWidth = 10
        posterImgView.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations ({ [weak self] in
            if self?.isFocused ?? false {
                self?.posterImgView.transform = self?.type == .carousal ? CGAffineTransform(scaleX: 1.02, y: 1.02) : CGAffineTransform(scaleX: 1.05, y: 1.05)
                self?.posterImgView.layer.borderColor = UIColor.white.cgColor
                
            } else {
                self?.posterImgView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self?.posterImgView.layer.borderColor = UIColor.clear.cgColor
            }
        }, completion: nil)
    }
}
