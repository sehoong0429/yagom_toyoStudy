//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var name: String
    var phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

class ViewController: UIViewController {
    // view
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // model
    var registrantList: [Registrant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // controller
    @IBAction func hitRegisterButton(_ sender: Any) {
        guard let name = nameTextField.text, let phoneNumber = phoneNumberTextField.text else { return }
        
        guard checkValidNameOrPhoneNumber(name: name,
                                          phoneNumber: phoneNumber) else {
            showRegistFailureAlert()
            return
        }
        
        registrantList.append(Registrant(name: name,
                                         phoneNumber: phoneNumber))
        showRegistSuccessAlert()
    }
    
    // controller
    @IBAction func hitCheckButton(_ sender: Any) {
        if !registrantList.isEmpty {
            let lastIndex = registrantList.count - 1
            let lastName: String = registrantList[lastIndex].name
            let lastPhoneNumber: String = registrantList[lastIndex].phoneNumber
            
            nameLabel.text = lastName
            phoneNumberLabel.text = lastPhoneNumber
        } else {
            showEmptyRegistrantListAlert()
        }
    }
    
    func register() {
    }
    
//    @IBAction func hitCheckRegistrantListButton(_ sender: Any) {
//        var list: String
//    }
    
    func showRegistFailureAlert() {
        let alert = UIAlertController(title: "등록 실패", message: "이름이나 전화번호가 유효한 값을 가지지 않음", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false)
    }
    
    func showRegistSuccessAlert() {
        let alert = UIAlertController(title: "등록 성공", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false)
    }
    
    func showEmptyRegistrantListAlert() {
        let alert = UIAlertController(title: "등록 된 대기 없음", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false)
    }
    
    func checkValidNameOrPhoneNumber(name: String, phoneNumber: String) -> Bool {
        if name.count == 0 {
            return false
        }
        
        guard Int(phoneNumber) != nil else {
            return false
        }
        
        return true
    }
}
