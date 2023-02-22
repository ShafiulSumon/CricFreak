//
//  SearchVC.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import UIKit
import SDWebImage

class SearchVC: UIViewController {
    
    var isSearching = false
    var data: [EasySearchModel] = []
    var searchData: [EasySearchModel] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        SearchViewModel.shared.getData()
        
        SearchViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async {
                self?.data = res ?? []
                print(self?.data.count)
                self?.tableView.reloadData()
            }
            
        }
    }
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return isSearching ? searchData.count : 0
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.searchCell, for: indexPath) as! SearchTVC
        
        cell.img.sd_setImage(with: URL(string: data[indexPath.row].image_path))
        cell.name.text = data[indexPath.row].name
        
        return cell
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = data.filter({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        isSearching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        tableView.reloadData()
    }
}
