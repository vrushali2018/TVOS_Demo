//
//  VideosTableViewCell.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit

protocol VideosCollectionViewCellDelegate: AnyObject {
    func didTappedOnIntem()
}

class VideosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var tblViewHeightCnst: NSLayoutConstraint!
    
    var latestVideos = ["debugging","lazyView","appleSignIn","inheritance","copyOnWrite","methodDispatch"]
    var carousalVideos = ["tvOS_development","iCode_Banner_Small"]
    var classifiedVideos = ["Interviews", "Swift UI", "Core Concepts", "DSA"]
    var toolsVideos = ["simsim","instruments","pusher", "debugging","lazyView","appleSignIn","inheritance"]
    
    var type: CellType = .lattestVideos
    
    weak var delegate: VideosCollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        registerNibs()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerNibs() {
        videosCollectionView.register(UINib(nibName: "VideosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideosCollectionViewCell")
        videosCollectionView.register(UINib(nibName: "ClassifiedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClassifiedCollectionViewCell")
        videosCollectionView.register(UINib(nibName: "ToolsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ToolsCollectionViewCell")
    }

}


extension VideosTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch type {
            
        case .carousal:
            return carousalVideos.count
        case .lattestVideos:
            return latestVideos.count
        case .classified:
            return classifiedVideos.count
        case .tools:
            return toolsVideos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch type {
            
        case .carousal:
            let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell", for: indexPath) as! VideosCollectionViewCell
            cell.type = type
            cell.posterImgView.image = UIImage(named: carousalVideos[indexPath.item])
            return cell
        case .lattestVideos:
            let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell", for: indexPath) as! VideosCollectionViewCell
            cell.type = type
            cell.posterImgView.image = UIImage(named: latestVideos[indexPath.item])
            return cell
        case .classified:
            let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "ClassifiedCollectionViewCell", for: indexPath) as! ClassifiedCollectionViewCell
            cell.type = type
            cell.configureView(text: classifiedVideos[indexPath.row])
            return cell
        case .tools:
            let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "ToolsCollectionViewCell", for: indexPath) as! ToolsCollectionViewCell
            cell.type = type
            cell.posterImgView.image = UIImage(named: toolsVideos[indexPath.item])
            cell.layoutIfNeeded()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch type {
        case .carousal:
            return CGSize(width: collectionView.frame.size.width - 180 , height: collectionView.frame.size.height)
        case .lattestVideos, .tools:
            return CGSize(width: collectionView.frame.size.height + 100 , height: collectionView.frame.size.height)
        case .classified:
            return CGSize(width: 360.0, height: 360.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didTappedOnIntem()
    }
}
