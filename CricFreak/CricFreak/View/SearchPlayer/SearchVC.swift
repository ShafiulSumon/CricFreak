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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        SearchViewModel.shared.getData()
        
        SearchViewModel.shared.observable.binding() { [weak self] res in
            DispatchQueue.main.async { [self] in
                self?.data = res ?? []
                print(self?.data.count)
                self?.searchData = Array((self?.data.prefix(upTo: 5)) ?? [])
                self?.tableView.reloadData()
            }
            
        }
    }
}

//MARK: - TableView Delegate
extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? searchData.count : 0
        //return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.searchCell, for: indexPath) as! SearchTVC
        
        cell.img.sd_setImage(with: URL(string: searchData[indexPath.row].image_path))
        cell.name.text = searchData[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print("\(searchData[indexPath.row].name)" + " : " + "\(searchData[indexPath.row].id)")
        
        let storyboard = UIStoryboard(name: "More", bundle: nil)
        if let careerVC = storyboard.instantiateViewController(withIdentifier: Constants.CareerVC) as? CareerVC {
            CareerViewModel.shared.getPlayerCareer(id: searchData[indexPath.row].id)
            careerVC.loadViewIfNeeded()
            self.navigationController?.pushViewController(careerVC, animated: true)
        }
    }
}

//MARK: - SearchBar Delegate
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
