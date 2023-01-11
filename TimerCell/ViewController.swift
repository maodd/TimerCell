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
        
        // this repating init style actually fill in same vm to the list.
//         viewModelList = [TimerViewModel](repeating: TimerViewModel(), count: 50)
        
        for _ in 0..<50 {
            viewModelList.append(TimerViewModel()) // ensure each vm is different.
        }

        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TimerCell = tableView.dequeueReusableCell(withIdentifier: "timerCell") as! TimerCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = cell as! TimerCell
        let vm = viewModelList[indexPath.row]
        cell.setViewModel(vm)
        if !vm.isManuallyPaused {
            vm.setupTimer()
        } // keep manually paused state
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! TimerCell
        let vm = viewModelList[indexPath.row]
        cell.setViewModel(vm)
        vm.pauseTimer(false)
        
        cell.viewModel = nil // vm no use anymore, can clean up.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = viewModelList[indexPath.row]
//        cell.setViewModel(vm)
        vm.pauseTimer(true)
    }

    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let vm = viewModelList[indexPath.row]
//        cell.setViewModel(vm)
        vm.setupTimer()
    }

}

