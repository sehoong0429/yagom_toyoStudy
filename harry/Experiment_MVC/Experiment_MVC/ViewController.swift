//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    let name: String
    let phoneNumber: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.register()
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        guard let name = nameTextField.text,
              let phoneNumber = phoneNumberTextField.text else { return }
        
        let dic = [
            NotificationKey.name: name,
            NotificationKey.phoneNumber: phoneNumber
        ]
        
        NotificationCenter.default.post(name: Notification.Name("regist"),
                                        object: nil,
                                        userInfo: dic)
    }

    func register() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayLabels(noti:)),
                                               name: Notification.Name.regist,
                                               object: nil)
    }
    
    @objc func displayLabels(noti: Notification) {
        guard let name = noti.userInfo?[NotificationKey.name] as? String else {
            return
        }
        guard let phoneNumber = noti.userInfo?[NotificationKey.phoneNumber] as? String else {
            return
        }
        
        self.nameLabel.text = name
        self.phoneNumberLabel.text = phoneNumber
    }
}

extension Notification.Name {
    static let regist = Notification.Name("regist")
    static let no = Notification.Name("no")
}

enum NotificationKey {
    case name
    case phoneNumber
}
