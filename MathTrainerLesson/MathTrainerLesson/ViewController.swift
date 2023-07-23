//
//  ViewController.swift
//  MathTrainerLesson
//
//  Created by Maria Kushka on 19.07.2023.
//

import UIKit

enum MathTypes: Int {
    case add, substract, multiply, divide
}

class ViewController: UIViewController {
// MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    // MARK: - Properties
    private var selectedType: MathTypes = .add
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureButtons()
    }
    
    // MARK: - Actions
    // Sender - тот объект, который присылает событие (в данном случае - кнопка)
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
        
    }
    
    @IBAction func unwindAction (unwinedSegue: UIStoryboardSegue) { }
    
    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainViewController {
            viewController.type = selectedType
        }
    }
    
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

