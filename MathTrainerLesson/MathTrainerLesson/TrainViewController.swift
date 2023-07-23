//
//  TrainViewController.swift
//  MathTrainerLesson
//
//  Created by Maria Kushka on 19.07.2023.
//

import UIKit

final class TrainViewController: UIViewController {
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
}

