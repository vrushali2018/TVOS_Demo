//
//  HomeViewController.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit

enum CellType: Int, CaseIterable {
    case carousal
    case lattestVideos
    case classified
    case tools
}

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var homeTblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        homeTblView.delegate = self
        homeTblView.dataSource = self
        setupTableView()
    }
    
    func setupTableView() {
        homeTblView.register(UINib(nibName: "VideosTableViewCell", bundle: nil), forCellReuseIdentifier: "VideosTableViewCell")
        homeTblView.estimatedRowHeight = 300
        homeTblView.rowHeight = UITableView.automaticDimension
        homeTblView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTblView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as! VideosTableViewCell
        let type: CellType = CellType(rawValue: indexPath.row) ?? .lattestVideos
        cell.type = type
        
        switch type {
        case .carousal:
            cell.titleLbl.isHidden = true
            cell.tblViewHeightCnst.constant = 540
        case .lattestVideos:
            cell.titleLbl.text = "Latest by iCode"
            cell.tblViewHeightCnst.constant = 360
            cell.type = type
            cell.delegate = self
        case .classified:
            cell.titleLbl.text = "Classified"
            cell.tblViewHeightCnst.constant = 360
            cell.videosCollectionView.reloadData()
            
        case .tools:
            cell.titleLbl.text = "Useful tools"
            cell.tblViewHeightCnst.constant = 300
            cell.videosCollectionView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension HomeViewController: VideosCollectionViewCellDelegate {
    func didTappedOnIntem() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.present(vc, animated: true)
    }
    
    
}
