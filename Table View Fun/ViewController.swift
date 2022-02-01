//
//  ViewController.swift
//  Table View Fun
//
//  Created by DANIEL VEGA on 2/1/22.
//

// using this project as a test project for table view sections and testing them for semester 2 project. 
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numArray = [Int]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor =  UIColor(cgColor: .init(red: 20, green: 1, blue: 20, alpha: 0.1))
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           lbl.font = UIFont.systemFont(ofSize: 20)
           lbl.text = "section: \(section)"
           view.addSubview(lbl)
           return view
         }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = String(numArray[indexPath.row])
        return cell
    }

    @IBAction func addNumberAction(_ sender: UIButton) {
        var random = Int.random(in: 0...10)
        numArray.append(random)
        tableViewOutlet.reloadData()
    }
    
    
}

