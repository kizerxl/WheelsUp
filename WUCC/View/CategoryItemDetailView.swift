//
//  CategoryItemDetailView.swift
//  WUCC
//
//  Created by Felix Changoo on 9/8/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class CategoryItemDetailView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CategoryItemDetailViewModel?
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var circleViewLbl: UILabel!
    @IBOutlet weak var birthLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        tableView.register(UINib(nibName: "CategoryItemDetailCell", bundle: nil), forCellReuseIdentifier: "CategoryItemDetailCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        customizeHeader()
    }
    
    func customizeHeader() {
        guard let viewModel = viewModel else { return }
        circleViewLbl.text = viewModel.initials
        birthLbl.text = viewModel.birthYear
        circleView.layer.cornerRadius = circleView.frame.size.height/2
        
        title = viewModel.name.uppercased()
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
}

extension CategoryItemDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension CategoryItemDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.properties.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryItemDetailCell") as? CategoryItemDetailCell,
            let viewModel = viewModel else {
                return UITableViewCell()
        }
        
        let keys = Array(viewModel.properties.keys)
        let key = keys[indexPath.row]
        let property = viewModel.properties[key]
        let propertyString = "\(property ?? "")"
        
        cell.configure(with: key, value: propertyString)
        return cell
    }
}
