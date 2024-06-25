//
//  ViewController.swift
//  AutoDoc
//
//  Created by Артем Соловьев on 25.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let viewTest = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        viewTest.backgroundColor = .red
        view.addSubview(viewTest)
        viewTest.activateAnchor()
        
        viewTest.pinToLeft(equalTo: view, withOffset: 20)
        viewTest.pinToRight(equalTo: view)
        viewTest.pinToBottom(equalTo: view)
        viewTest.pinToTop(equalTo: view)
    }
}

