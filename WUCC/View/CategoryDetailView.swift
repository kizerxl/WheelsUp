//
//  CategoryDetailView.swift
//  WUCC
//
//  Created by Felix Changoo on 9/8/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit

class CategoryDetailView<T: Codable>: UIViewController, UITableViewDelegate,
UITableViewDataSource where T: StarWarsCommonCategory {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CategoryDetailViewModel<T>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        guard let viewModel = viewModel else { return }
        title = viewModel.type.rawValue.uppercased()
        
        tableView.register(UINib(nibName: "CategoryDetailCell", bundle: nil), forCellReuseIdentifier: "CategoryDetailCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.categoryItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailCell") as? CategoryDetailCell,
            let viewModel = viewModel else {
                return UITableViewCell()
        }
        
        let categoryItem = viewModel.categoryItems[indexPath.row]
        cell.configure(with: categoryItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let viewModel = viewModel else { return }
        let categoryItem = viewModel.categoryItems[indexPath.row]
    
        guard let properties = categoryItem.properties else { return }
        
        let resultView = CategoryItemDetailView(nibName: "CategoryItemDetailView", bundle: nil)
        resultView.viewModel = CategoryItemDetailViewModel(properties: properties, initials: categoryItem.swName.getInitials() ?? "", birthYear: categoryItem.swBirthYear, name: categoryItem.swName)
        navigationController?.pushViewController(resultView, animated: true)
    }
}
