//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    var delegate: PointManagerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2. viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("2. viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("2. viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("2. viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("2. viewDidDisappear")
    }
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        delegate?.pointManager.point -= 50
        dismiss(animated: true)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
