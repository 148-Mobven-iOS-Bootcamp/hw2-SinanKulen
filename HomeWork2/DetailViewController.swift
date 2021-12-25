//
//  DetailViewController.swift
//  HomeWork2
//
//  Created by Sinan Kulen on 24.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    var emergencyDelegate : DataTransferProtocol?
    var dataTransferClosure : ((String) -> Void)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(health), name: Notification.Name("postName"), object: nil)
    }
    //MARK: NotificationCenter ile gelen veriyi detailLAbel ile ekrana yazdırıyoruz.
    @objc func health(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        if let info = userInfo["doctor"] as? String {
            self.detailLabel.text = "\(info)"
        }
    }
 
    @IBAction func emergencyButton(_ sender: UIButton) {
         // MARK: Delegate ile butona basıldığında phoneNumber'ı ViewController'a iletmiş oluyoruz.
        dismiss(animated: true) {
            self.emergencyDelegate?.emergencyCall(phoneNumber: (sender.titleLabel?.text)!)
        }
        
        //MARK: Closure ile butona basıldığında button title'ı ViewController'a iletmiş oluyoruz.
        dismiss(animated: true) { [weak self] in
            self?.dataTransferClosure?((sender.titleLabel?.text!)!)
        }
    }
    
    
}
