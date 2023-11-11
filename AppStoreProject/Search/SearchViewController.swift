//
//  SearchViewController.swift
//  AppStoreProject
//
//  Created by Chaewon on 2023/11/07.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

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
        view.rowHeight = 120
        return view
    }()
    
    var appData: [AppInfo] = []
    
    lazy var items = BehaviorSubject(value: appData)
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setSearchBar()
        configure()
        
        bind()
        
    }
    
    func bind() {
        items
            .bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) { (row, element, cell) in
                cell.appIconImageView.kf.setImage(with: URL(string: element.artworkUrl512))
                cell.appNameLabel.text = element.trackName
                cell.ratingLabel.text = "\()"
                cell.sellerNameLabel.text = element.sellerName
                cell.genreNameLabel.text = element.primaryGenreName
            }
            .disposed(by: disposeBag)
        
        let request = APIManager.fetchData()
            .asDriver(onErrorJustReturn: SearchAppModel(resultCount: 0, results: []))
        
        request
            .drive(with: self) { owner, result in
                owner.items.onNext(result.results)
            }
            .disposed(by: disposeBag)
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
