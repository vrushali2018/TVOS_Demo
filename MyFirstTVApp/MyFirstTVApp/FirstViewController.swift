//
//  ViewController.swift
//  MyFirstTVApp
//
//  Created by Neosoft on 10/08/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    var timer = Timer()
    var postDuration = 10
    var indexProgressBar = 0
    var currentProgressIndex = 0
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressView.progress = 0.0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setProgressBar), userInfo: nil, repeats: true)
    }
    
    func getProgNext() {
        currentProgressIndex += 1
    }
    
    @objc func setProgressBar() {
        if indexProgressBar == postDuration {
            timer.invalidate()
            progressView.isHidden = true
            
            let appdelegate = UIApplication.shared.delegate as! AppDelegate

            let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
            homeVC.tabBarItem.title = "Home"

            let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController")
            searchVC.tabBarItem.title = "Search"

            let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
            profileVC.tabBarItem.title = "Profile"

            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [homeVC, searchVC, profileVC]
            
            appdelegate.window?.rootViewController = tabBarController
        }
        
        progressView.progress = Float(indexProgressBar) / Float(postDuration - 1)
        indexProgressBar += 1
    }
}
