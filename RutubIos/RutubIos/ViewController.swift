//
//  ViewController.swift
//  RutubIos
//
//  Created by Kalandarov Vakil on 21.04.2022.
//

import UIKit

class ViewController: UIViewController, UISearchControllerDelegate {
    
    private lazy var resultTableView = UITableView()
    private lazy var searchController = UISearchController()
    private lazy var myTextField = UITextField()
    private let identefire = "My cell"
    private let networkService = NetworkService()
    private var result: [Results] = []
    private var html: ModelVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        createTableSearch()
        createSearchBar()
        
    }
    
    private func createSearchBar() {
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.delegate = self
        
    }
    
    private func getModel(text: String) {
        networkService.request(text: text) { (result) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.result = model.results
                    self.resultTableView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func createTableSearch() {
        resultTableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        resultTableView.register(TableCell.self, forCellReuseIdentifier: identefire)
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.keyboardDismissMode = .onDrag
        view.addSubview(resultTableView)
    }
    
   
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        if text.count != 0 {
            getModel(text: text)
        }

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identefire, for: indexPath) as? TableCell {
            cell.createCell(text: result[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        networkService.requestVideo(id: result[indexPath.row].id) { (result) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    let vc = WebViewController()
                    vc.setUpLabel(text: self.result[indexPath.row].title,
                                  author: self.result[indexPath.row].author.name,
                                  date: self.result[indexPath.row].publicationTs)
                    vc.createWeb(url: model.html ?? "")
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(_):
                print("error")
            }
        }
    }
}
