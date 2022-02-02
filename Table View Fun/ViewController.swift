//
//  ViewController.swift
//  Table View Fun
//
//  Created by DANIEL VEGA on 2/1/22.
//

// using this project as a test project for table view sections and testing them for semester 2 project. 
import UIKit
public class Stuff {
    var value: Int
    var whatSection: Int
    init(v: Int, ws: Int){
        value = v
        whatSection = ws
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numArray = [Stuff]()
    var currentSection = 0
    var m0 = 0
    var m1 = 0
    var m2 = 0
    var m3 = 0
    var m4 = 0
    var m5 = 0
    var m6 = 0
    var m7 = 0
    var m8 = 0
    var m9 = 0
    var arr = [Int]()
    func setArr() {
        arr.append(m0)
        arr.append(m1)
        arr.append(m2)
        arr.append(m3)
        arr.append(m4)
        arr.append(m5)
        arr.append(m6)
        arr.append(m7)
        arr.append(m8)
        arr.append(m9)
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.clipsToBounds = true
        tableViewOutlet.layer.cornerRadius = 30.0
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor =  UIColor(cgColor: .init(red: 100, green: 1, blue: 100, alpha: 1))
             
           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
           lbl.font = UIFont.systemFont(ofSize: 20)
           lbl.text = "section: \(section)"
           view.addSubview(lbl)
           return view
         }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = String(numArray[indexPath.row].value)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var bound = 0
        var stored = -1
        while(bound < numArray.count) {
           stored = numArray[bound].whatSection
            
            switch stored{
            case 0:
                m0 += 1
            case 1:
                m1 += 1
            case 2:
                m2 += 1
            case 3:
                m3 += 1
            case 4:
                m4 += 1
            case 5:
                m5 += 1
            case 6:
                m6 += 1
            case 7:
                m7 += 1
            case 8:
                m8 += 1
            case 9:
                m9 += 1
            default:
                m0 += 1
            }
            bound += 1
        }
        tableViewOutlet.reloadData()
        let max = arr.max() ?? 0
        return max
        
    }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
    }
         
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 40
    }
    
    @IBAction func addNumberAction(_ sender: UIButton) {
        var random = Int.random(in: 0...9)
        numArray.append(Stuff(v: random, ws: currentSection))
        if currentSection < 9 {
            currentSection += 1
        }
        else{
            currentSection = 0
        }
        tableViewOutlet.reloadData()
    }
    
    
}

