//
//  SearchViewController.swift
//  AppStoreProject
//
//  Created by Chaewon on 2023/11/07.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "게임, 앱, 스토리 등"
        view.showsCancelButton = true
        return view
    }()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        view.rowHeight = 80
        view.separatorStyle = .none
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setSearchBar()
        configure()
        
    }
    
    private func setSearchBar() {
        view.addSubview(searchBar)
        self.navigationItem.titleView = searchBar
    }
    
    private func configure() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
}
