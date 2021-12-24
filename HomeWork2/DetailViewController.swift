//
//  DetailViewController.swift
//  HomeWork2
//
//  Created by Sinan Kulen on 24.12.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var emergencyDelegate : DataTransferProtocol?
    var dataTransferClosure : ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 
    @IBAction func emergencyButton(_ sender: UIButton) {
         //Delegate ile butona basıldığında phoneNumber'ı ViewController'a iletmiş oluyoruz.
        // dismiss(animated: true) {
       //  self.emergencyDelegate?.emergencyCall(phoneNumber: (sender.titleLabel?.text)!)
      //  }
        
        //Closure ile butona basıldığında button title'ı ViewController'a iletmiş oluyoruz.
        dismiss(animated: true) { [weak self] in
            self?.dataTransferClosure?((sender.titleLabel?.text!)!)
        }
    }
    
    
}
