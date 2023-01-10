//
//  TimerCell.swift
//  TimerCell
//
//  Created by Frank on 1/10/23.
//

import UIKit

class TimerCell: UITableViewCell, TimerViewModelDelegate {
    func onTimerStateChanges(_ isPaused: Bool) {
        self.runningFlag.isHidden = !isPaused
    }
    
    func onTimerTick(_ time: Decimal) {
        guard let vm = viewModel else { timeLabel.text = "0.0" ; return }
        
        self.timeLabel.text = "\(vm.totalTime)"
        
    }
    

    @IBOutlet weak var timeLabel:UILabel!
    @IBOutlet weak var runningFlag:UIView!
    
    var viewModel: TimerViewModel?
    
    func setViewModel(_ vm: TimerViewModel) {
        viewModel = vm
        viewModel?.delegate = self
        guard let vm = viewModel else { timeLabel.text = "0.0" ; return }
        timeLabel.text = "\(vm.totalTime)"
                
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
