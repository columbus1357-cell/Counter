//
//  ViewController.swift
//  Counter
//
//  Created by Aleksandr on 12.05.2026.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    var count = 0
    var historyLog = "История изменений:\n"

    func data() -> String {
        let data = Date()
        let format = DateFormatter()
        format.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return format.string(from: data)
    }
    
    func updateHistory() {
        historyTextView.text = historyLog
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        historyLog += "\(data()): значение изменено на +1\n"
        updateHistory()
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        if count == 0 {
            historyLog += "\(data()):попытка уменьшить счётчик ниже 0\n"
            updateHistory()
        } else if count > 0 {
            count -= 1
            counterLabel.text = "Значение счётчика: \(count)"
            historyLog += "\(data()):значение изменено на -1\n"
            updateHistory()
        }
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика: \(count)"
        historyLog += "\(data()):значение сброшено\n"
        updateHistory()
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
