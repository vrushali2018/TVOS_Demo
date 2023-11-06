//
//  DetailsViewController.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit
import AVKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var simmilartTblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        registerTblView()
    }
    
    func registerTblView() {
        simmilartTblView.register(UINib(nibName: "VideosTableViewCell", bundle: nil), forCellReuseIdentifier: "VideosTableViewCell")
        simmilartTblView.estimatedRowHeight = 300
        simmilartTblView.rowHeight = UITableView.automaticDimension
        simmilartTblView.reloadData()
    }
    
    @IBAction func didClickOnPlayBtn(_ sender: UIButton) {
        
        guard let path = Bundle.main.path(forResource: "earthVideo", ofType: "mp4") else {
            debugPrint("Earth video is not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.player?.currentItem?.externalMetadata = makeExternalMetaData()
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    func makeExternalMetaData() -> [AVMetadataItem] {
        var metaData = [AVMetadataItem]()
        
        // build title item
        
        let titleItem = makeMetadataItem(.commonIdentifierTitle, value: "Improve your debugging skill")
        metaData.append(titleItem)
        
       // build artwork item
        if let image = UIImage(named: "debugging"), let pngData = image.pngData() {
            let artworkItem = makeMetadataItem(.commonIdentifierArtwork, value: pngData)
            metaData.append(artworkItem)
        }
        
            // build description item
        let descItem = makeMetadataItem(.commonIdentifierDescription, value: """
                   Open the Slack app.
                   From the Home tab, swipe right to open the main menu.
                   Locate your workspace's Slack URL below the workspace name.
"""
        )
        metaData.append(descItem)
        
        // build genre item
        
        let genreItem = makeMetadataItem(.commonIdentifierTitle, value: "Education")
        metaData.append(genreItem)
        return metaData
        
        
    }
    
    private func makeMetadataItem(_ identifier: AVMetadataIdentifier, value: Any) -> AVMetadataItem {
        let item = AVMutableMetadataItem()
        item.identifier = identifier
        item.value = value as? NSCopying & NSObjectProtocol
        item.extendedLanguageTag = "und"
        return item.copy() as! AVMetadataItem
    }

}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VideosTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as! VideosTableViewCell
        cell.type = .lattestVideos
        cell.latestVideos.removeFirst()
        cell.tblViewHeightCnst.constant = 200
        cell.titleLbl.text = "You May Like"
        
        return cell
    }
    
    
}
