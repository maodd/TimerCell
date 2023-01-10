//
//  ViewController.swift
//  TimerCell
//
//  Created by Frank on 1/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView:UITableView!
    
    var viewModelList = [TimerViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<50 {
            viewModelList.append(TimerViewModel(i))
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelList.count
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TimerCell = tableView.dequeueReusableCell(withIdentifier: "timerCell") as! TimerCell
        
//        let vm = viewModelList[indexPath.row]
//        vm.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true
//                                        , block: { t in
//            vm.totalTime += 0.1
//            cell.timeLabel.text = "\(vm.totalTime)"
//        })
//        RunLoop.main.add(vm.timer, forMode: .common)
//        cell.setViewModel(vm)
//        vm.startOrResumeTimer()
//        vm.timer.invalidate()
//        vm.timer.fire()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = cell as! TimerCell
        let vm = viewModelList[indexPath.row]
        cell.setViewModel(vm)
        vm.setupTimer()
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! TimerCell
        let vm = viewModelList[indexPath.row]
        cell.setViewModel(vm)
        vm.pauseTimer()
    }

}

