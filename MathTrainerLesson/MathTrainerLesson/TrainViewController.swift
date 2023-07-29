//
//  TrainViewController.swift
//  MathTrainerLesson
//
//  Created by Maria Kushka on 19.07.2023.
//

import UIKit

final class TrainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureButtons()
    }
    
    // MARK: - Methods
    private func configureButtons() {
        // Add shadow
        buttonsCollection.forEach { button in
            // cgColor, потому что этого требует shadow
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.5
            // отвечает за размытие тени. По умолчанию - 3
//            button.layer.shadowRadius
        }
    }
}

