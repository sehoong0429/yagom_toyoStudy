//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    var point: Int = 50
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var pointLabel: UILabel!
    
    let pointManager = PointManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Main viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Main viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Main viewWillDisAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Main viewDidDisAppear")
    }
    
    @IBAction func didTapBuyNewItem(_ sender: UIButton) {
        guard let buyingViewController = self.storyboard?
            .instantiateViewController(withIdentifier: BuyingViewController.identifier) as? BuyingViewController else { return }
        buyingViewController.delegate = self
        buyingViewController.pointManager = self.pointManager
        
        buyingViewController.modalPresentationStyle = .fullScreen
        self.present(buyingViewController, animated: true)
    }
    
    @IBAction func updatePoint(_ sender: Any) {
        pointLabel.text = "\(pointManager.point)"
        print("\(pointManager.point)")
    }
    
    private func setDefaultLabel() {
        pointLabel.text = "\(pointManager.point)"
    }
}

extension MainViewController: Delegate {
    func buyNewItem(pointManager: PointManager) {
        if pointManager.point >= 50 {
            pointManager.point -= 50
        } else {
            print("구매 실패")
        }
    }
}


protocol Delegate: AnyObject {
    func buyNewItem(pointManager: PointManager)
}
