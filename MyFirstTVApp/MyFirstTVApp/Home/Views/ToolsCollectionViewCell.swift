//
//  ToolsCollectionViewCell.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit

class ToolsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImgView: UIImageView!
    
    var type: CellType = .lattestVideos
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImgView.layer.cornerRadius = 20
        posterImgView.clipsToBounds = true
        posterImgView.layer.borderWidth = 10
        posterImgView.layer.borderColor = UIColor.clear.cgColor
    }
    
     
}
