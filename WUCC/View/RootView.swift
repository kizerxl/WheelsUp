//
//  RootView.swift
//  WUCC
//
//  Created by Felix Changoo on 9/2/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class RootView: UIViewController {
    var viewModel: RootViewModel?
    let disposeBag = DisposeBag()
    
    var storyBoard : UIStoryboard {
        return UIStoryboard(name: "Main", bundle:nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    func setupView() {
        viewModel = RootViewModel()
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "STAR WARS API"
        navigationController?.navigationBar.barStyle = UIBarStyle.black
    }
}

extension RootView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.swCategories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? StarWarsCategoryCell,
            let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        let categoryModel = viewModel.swCategories[indexPath.section][indexPath.row]
        cell.configure(with: categoryModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    private func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
}

extension RootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let categoryModel = viewModel?.swCategories[indexPath.section][indexPath.row] else { return }
        viewModel?.performRequest(for: categoryModel.type, urlString: categoryModel.categoryURL)
    }
}

extension RootView {
    func setupBindings() {
        setupPeopleBinding()
        setupFilmsBinding()
        setupStarShipsBinding()
        setupVehiclesBinding()
        setupSpeciesBinding()
        setupPlanetsBinding()
    }
    
    private func setupPeopleBinding() {
        viewModel?.peopleResult.drive(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            guard let apiResult = result else { return }
            
            let resultView = CategoryDetailView<People>(nibName: "CategoryDetailView", bundle: nil)
            resultView.viewModel = CategoryDetailViewModel(apiResult: apiResult, type: .people)
            strongSelf.navigationController?.pushViewController(resultView, animated: true)
        }).disposed(by: disposeBag)
    }
    
    
    private func setupFilmsBinding() {
        viewModel?.filmsResult.drive(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            guard let apiResult = result else { return }
            
            let resultView = CategoryDetailView<Films>(nibName: "CategoryDetailView", bundle: nil)
            resultView.viewModel = CategoryDetailViewModel(apiResult: apiResult, type: .films)
            strongSelf.navigationController?.pushViewController(resultView, animated: true)
        }).disposed(by: disposeBag)
    }
    
    
    private func setupStarShipsBinding() {
        viewModel?.starshipsResult.drive(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            guard let apiResult = result else { return }
            
            let resultView = CategoryDetailView<Starships>(nibName: "CategoryDetailView", bundle: nil)
            resultView.viewModel = CategoryDetailViewModel(apiResult: apiResult, type: .starships)
            strongSelf.navigationController?.pushViewController(resultView, animated: true)
        }).disposed(by: disposeBag)
    }
    
    
    private func setupVehiclesBinding() {
        viewModel?.vehiclesResult.drive(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            guard let apiResult = result else { return }
            
            let resultView = CategoryDetailView<Vehicles>(nibName: "CategoryDetailView", bundle: nil)
            resultView.viewModel = CategoryDetailViewModel(apiResult: apiResult, type: .vehicles)
            strongSelf.navigationController?.pushViewController(resultView, animated: true)
        }).disposed(by: disposeBag)
    }
    
    
    private func setupSpeciesBinding() {
        viewModel?.speciesResult.drive(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            guard let apiResult = result else { return }
            
            let resultView = CategoryDetailView<Species>(nibName: "CategoryDetailView", bundle: nil)
            resultView.viewModel = CategoryDetailViewModel(apiResult: apiResult, type: .species)
            strongSelf.navigationController?.pushViewController(resultView, animated: true)
        }).disposed(by: disposeBag)
    }
    
    private func setupPlanetsBinding() {
        viewModel?.planetsResult.drive(onNext: { [weak self] result in
            guard let strongSelf = self else { return }
            guard let apiResult = result else { return }
            
            let resultView = CategoryDetailView<Planets>(nibName: "CategoryDetailView", bundle: nil)
            resultView.viewModel = CategoryDetailViewModel(apiResult: apiResult, type: .planets)
            strongSelf.navigationController?.pushViewController(resultView, animated: true)
        }).disposed(by: disposeBag)
    }
}
