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
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            switch type {
            case .add:
                sign = "+"
            case .substract:
                sign = "-"
            case .multiply:
                sign = "*"
            case .divide:
                sign = "/"
            }
        }
    }
    
    private var firstNumber: Int = 0
    private var secondNumber: Int = 0
    private var sign: String = ""
    private var count: Int = 0 {
        didSet {
            print("Count: \(count)")
        }
    }

    
    private var answer: Int {
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .substract:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .divide:
            return firstNumber / secondNumber
        }
    }
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureQuestion()
        configureButtons()
        
    }
    
    // MARK: - IBActions
    @IBAction func leftAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction func rightaction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)

    }
    // MARK: - Methods
    private func configureButtons() {
        // change color to yellow before new question
        [leftButton, rightButton].forEach { button in button?.backgroundColor = .systemYellow}
        
        // Add shadow
        buttonsCollection.forEach { button in
            // cgColor, потому что этого требует shadow
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.5
            // отвечает за размытие тени. По умолчанию - 3
            //            button.layer.shadowRadius
        }
        
        let isRightButton = Bool.random() // на основании этого будем решать, в какую кнопку вставлять правильный ответ
        var randomAnswer: Int
        repeat { randomAnswer = Int.random(in: (answer - 10)...(answer + 10))
        } while randomAnswer == answer
        
        rightButton.setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal) // normal - нормальное состояние кнопки
        leftButton.setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
    }
    
    private func configureQuestion() {
        firstNumber = Int.random(in: 1...99)
        secondNumber = Int.random(in: 1...99)
        
        let question: String = "\(firstNumber) \(sign) \(secondNumber) ="
        questionLabel.text = question
        
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRighAnswer = Int(answer) == self.answer
        
        button.backgroundColor = isRighAnswer ? .systemGreen : .red
        
        if isRighAnswer {
            var isSecondTry: Bool = rightButton.backgroundColor == .red
                || leftButton.backgroundColor == .red
            if !isSecondTry {
                count += 1
            }
//            count += isSecondTry ? 0 : 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.configureQuestion()
                self?.configureButtons()
            }
        }
    }
    
}
