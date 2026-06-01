//
//  ViewController.swift
//  Counter
//
//  Created by Aleksandr on 12.05.2026.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    // MARK: - Properties
    private var count = 0
    private var historyLog = "История изменений:\n"
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Private Methods
    private func currentDateString() -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return format.string(from: date)
    }
    
    private func updateHistory() {
        historyTextView.text = historyLog
    }
    // MARK: - Actions
    @IBAction private func plusTapped(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        historyLog += "\(currentDateString()): значение изменено на +1\n"
        updateHistory()
    }
    
    @IBAction private func minusTapped(_ sender: Any) {
        if count == 0 {
            historyLog += "\(currentDateString()): попытка уменьшить счётчик ниже 0\n"
            updateHistory()
        } else if count > 0 {
            count -= 1
            counterLabel.text = "Значение счётчика: \(count)"
            historyLog += "\(currentDateString()): значение изменено на -1\n"
            updateHistory()
        }
    }
    
    @IBAction private func resetTapped(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика: \(count)"
        historyLog += "\(currentDateString()): значение сброшено\n"
        updateHistory()
    }
    
}
