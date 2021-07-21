//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки в озврата назад на экране результатов
    
    @IBOutlet weak var emojiResultLabel: UILabel!
    @IBOutlet weak var textResultLabel: UILabel!
    
    
    var transferredResults: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        mappingResults()
    }
    
    
    func mappingResults() {
        let mappedResults = Array(transferredResults)
        
        let countsOfEqualResults = Dictionary(mappedResults.map { ($0, 1) }, uniquingKeysWith: +)
        let sortedEqualResult = countsOfEqualResults.sorted(by: { $0.value > $1.value })
        
        guard let winner = sortedEqualResult.first?.key else { return }
        
        showUserResult(answer: winner)
    }
    
    private func showUserResult (answer: Answer) {
        emojiResultLabel.text = "Вы - \(answer.type.rawValue)"
        textResultLabel.text = answer.type.definition
    }
    
}
