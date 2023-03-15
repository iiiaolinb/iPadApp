//
//  PopoverTableView.swift
//  iPadApp
//
//  Created by Егор Худяев on 15.03.2023.
//

import UIKit

final class PopoverTableView: UITableViewController {
    
    private var model = PopoverModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
    }
    
//    init() {
//        super.init(frame: CGRect.zero, style: .plain)
//
//        backgroundColor = .lightGray
//        dataSource = self
//        delegate = self
//        //register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.cellId)
//
//        showsVerticalScrollIndicator = false
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return model.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = model.list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
