//
//  ViewController.swift
//  UITableViewExample
//
//  Created by Tùng Thiện on 28/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let arrayUser:[User] = [
        User(name: "Tùng1", age: "201", address: "folder"),
        User(name: "Tùng2", age: "202", address: "folder"),
        User(name: "Tùng3", age: "203", address: "folder"),
        User(name: "Tùng4", age: "204", address: "folder"),
        User(name: "Tùng5", age: "205", address: "folder"),
        User(name: "Tùng6", age: "206", address: "folder"),
        User(name: "Tùng7", age: "207", address: "folder"),
        User(name: "Tùng8", age: "208", address: "folder"),
        User(name: "Tùng9", age: "209", address: "folder"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //phuong thuc lien quan den dong cell
        tableView.delegate = self
        //phuong thuc lien quan den du lieu cua tung dong
        tableView.dataSource = self
        //ẩn row trống
        tableView.tableFooterView = .none
        // chinh padding 4 goc cua tablerView
        //tableView.contentInset = .init(top: 16, left: 16, bottom: 32, right: 16)
        print("Tungggg")
    }
}

//ke thua 2 thuoc tinh tu ViewController
extension ViewController:UITableViewDelegate, UITableViewDataSource
{
    //ham tra ve so sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    //ham tra ve so dong cua moi section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 4
        switch section {
        case 0:
            return 4
        case 1:
            return 5
        case 2:
            return 6
        case 3:
            return 7
        default:
            return 3
        }
    }
    //ham tra ve ten cua moi section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section thu \(section)"
        case 1:
            return "Section \(section)"
        case 2:
            return "Section: \(section)"
        case 4:
            return "Section la \(section)"
        default:
            return "Khong co"
        }
    }
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            cell.textLabel?.text = arrayUser[indexPath.row].name
            cell.detailTextLabel?.text = arrayUser[indexPath.row].age
            cell.imageView?.image = UIImage(systemName: arrayUser[indexPath.row].address)
            return cell
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "Row \(indexPath.row)"
            cell.imageView?.image = UIImage(systemName: arrayUser[indexPath.row].address)
            return cell
        case 2:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "Row \(indexPath.row)"
            return cell
        case 3:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = "Row \(indexPath.row)"
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.size.width * 102 / 312
    }
    
    //hành động kéo từ phải qua
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteButton = UIContextualAction(style: .destructive, title: "delete"){ _, _, _ in
            print("Deleted row at \(indexPath.row)")
        }
        deleteButton.backgroundColor = .red
        let config = UISwipeActionsConfiguration(actions: [deleteButton])
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = SecondViewController()
        self.present(vc, animated: true, completion: nil)
    }
}

