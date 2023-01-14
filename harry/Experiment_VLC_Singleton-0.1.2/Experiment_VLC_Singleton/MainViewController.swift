//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    //static let shared = PointManager()
    var point: Int = 50
}

class MainViewController: UIViewController, PointManagerDelegate {
    
    @IBOutlet weak var pointLabel: UILabel!
    
    var pointManager: PointManager = PointManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1. viewDidLoad")
        pointLabel.text = pointManager.point.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("1. viewWillAppear")
        print(pointManager.point)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("1. viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("1. viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("1. viewDidDisappear")
    }
    
    @IBAction func presentBuyingPage(_ sender: UIButton) {
        guard let buyingVC = storyboard?.instantiateViewController(withIdentifier: "BuyingViewController") as? BuyingViewController else { return }
        buyingVC.delegate = self
        buyingVC.modalPresentationStyle = .fullScreen
        present(buyingVC, animated: true)
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        pointLabel.text = pointManager.point.description
    }
}

