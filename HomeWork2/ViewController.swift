//
//  ViewController.swift
//  HomeWork2
//
//  Created by Sinan Kulen on 24.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var transferLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //MARK: Delegate ile gelen veri yazdırıldı.
        if segue.identifier == "delegateSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.emergencyDelegate = self
            }
            
        //MARK: Closure ile gelen veri transferLabel ile ekrana yazdırıldı.
        } else if segue.identifier == "closureSegue" {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.dataTransferClosure = { [weak self] phoneNumber in
                    self!.transferLabel.text = phoneNumber
                }
            }
        //MARK: Notification Center ile veriyi alması için DetailViewController'a gönderildi.
        } else if segue.identifier == "notificationSegue" {
            if segue.destination is DetailViewController {
            let response = ["doctor":"patient"]
            NotificationCenter.default.post(name: Notification.Name("postName"), object: nil, userInfo: response)
            }
        }
    }
    
}

extension ViewController: DataTransferProtocol {
    func emergencyCall(phoneNumber: String) {
        print("Acil Numarası: \(phoneNumber)")
    }
}
