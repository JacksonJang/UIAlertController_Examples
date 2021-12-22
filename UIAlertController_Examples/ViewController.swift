//
//  ViewController.swift
//  UIAlertController_Examples
//
//  Created by 장효원 on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    let data:[String] = ["OK Alert", "OK And Cancel Alert", "ALL Alert"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func showOKAlert() {
        let alertVC = UIAlertController(title: "title", message: "PreferredStyle is alert", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "OK", style: .default){ _ in
            print("success")
        }
        
        alertVC.addAction(successAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showOKAndCancelAlert() {
        let alertVC = UIAlertController(title: "title", message: "PreferredStyle is alert", preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("success")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel")
        }
        
        alertVC.addAction(successAction)
        alertVC.addAction(cancelAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showALLAlert() {
        let alertVC = UIAlertController(title: "title", message: "PreferredStyle is alert", preferredStyle: .alert)
        
        let successAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("success")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("cancel")
        }
        let destructiveAction = UIAlertAction(title: "Destructive", style: .destructive) { _ in
            print("destructive")
        }
        
        alertVC.addAction(successAction)
        alertVC.addAction(cancelAction)
        alertVC.addAction(destructiveAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            showOKAlert()
        case 1:
            showOKAndCancelAlert()
        case 2:
            showALLAlert()
        default:
            showOKAndCancelAlert()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CustomTableViewCell

        cell.titleLabel.text = data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
}
