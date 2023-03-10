//
//  TimerViewModel.swift
//  TimerCell
//
//  Created by Frank on 1/10/23.
//

import Foundation

protocol TimerViewModelDelegate : AnyObject {
    func onTimerTick(_ time: Decimal)
    func onTimerStateChanges(_ isRunning: Bool)
}

class TimerViewModel {
    
    weak var delegate:TimerViewModelDelegate?
    
    var isRunning: Bool {
        get {
            return timer != nil && timer!.isValid
        }
    }
    var isManuallyPaused: Bool = false
    var timer: Timer?    
    
    var totalTime: Decimal = 0.0
    
    @objc func increaseTotalTime() {
        totalTime += 0.1
        
        // UI
        delegate?.onTimerTick(totalTime)
    }

    
    func setupTimer(){
        if self.timer == nil {
            let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseTotalTime), userInfo: nil, repeats: true)
            
            RunLoop.main.add(timer, forMode: .common) // enable timer keep running during scrolling/background
            
            self.timer = timer
        }
        self.timer?.fire()
        delegate?.onTimerStateChanges(isRunning)
    }
    
    func pauseTimer(_ manualyPaused: Bool) {
        if timer != nil {
            timer!.invalidate()
            timer = nil
            isManuallyPaused = manualyPaused
            delegate?.onTimerStateChanges(isRunning)
        }
    }

    
}
