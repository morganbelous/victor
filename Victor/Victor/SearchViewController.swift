//
//  SearchViewController.swift
//  Victor
//
//  Created by Morgan Belous on 8/18/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    var searchCollectionView: UICollectionView!
    let profCellReuseIdentifier = "profCellReuseIdentifier"
    
    var searchBar: UISearchBar!
    var isSearching: Bool! = false
    
    var profs: [Professional] = []
    var filteredProfs: [Professional] = []
    
    var headerPadding: CGFloat! = 75
    let sidePadding: CGFloat = 8
    let topPadding: CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 133/255, green: 176/255, blue: 183/255, alpha: 1.0)
    
        let jack = Professional(name: "Jack", username: "jack123", bio: "I'm a soccer player", profileImageName: "man")
        let morgan = Professional(name: "Morgan", username: "morgan326", bio: "I'm a volleyball player", profileImageName: "woman")
        let sam = Professional(name: "Sam", username: "sam125", bio: "I'm a tennis player", profileImageName: "woman2")
        
        profs = [jack, morgan, sam, jack, morgan, sam]
        filteredProfs = profs
        
        searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search"
        let searchBarText = searchBar.value(forKey: "searchField") as? UITextField
        searchBarText?.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: profCellReuseIdentifier)
        searchCollectionView.backgroundColor = .white
//        searchCollectionView.layer.cornerRadius = 50.0
//        searchCollectionView.layer.borderWidth = 1.0
//        searchCollectionView.layer.borderColor = UIColor.clear.cgColor
//        searchCollectionView.layer.masksToBounds = true
        view.addSubview(searchCollectionView)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(topPadding)
            make.left.equalTo(view).offset(sidePadding)
            make.right.equalTo(view).offset(-sidePadding)
            make.height.equalTo(40)
        }
        
        searchCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(headerPadding)
            make.bottom.left.right.equalTo(view)
        }
    }
    
    @objc func pushProfDetailsViewController(){
        // MAKE SURE THIS WORKS WITH SEARCHING??
        if let indexPath = self.searchCollectionView.indexPathsForSelectedItems?.first{
            let prof = isSearching ? filteredProfs[indexPath.row] : profs[indexPath.row]
            let detailsViewController = ProfDetailsViewController(profName: prof.name, profUsername: prof.username, profBio: prof.bio, profProfileImageName: prof.profileImageName)
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension SearchViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredProfs.removeAll(keepingCapacity: false)
        let predicateString = searchBar.text!
        filteredProfs = profs.filter({$0.name.range(of: predicateString, options: .caseInsensitive) != nil})
        filteredProfs.sort{$0.name < $1.name}
        isSearching = (filteredProfs.count == 0) ? false: true
        searchCollectionView.reloadData()
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filteredProfs.count
        } else if (searchBar.text == "")  {
             return profs.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profCellReuseIdentifier, for: indexPath) as! SearchCollectionViewCell
        if isSearching {
            let prof = filteredProfs[indexPath.item]
            cell.configure(for: prof)
            return cell
        } else {
            let prof = profs[indexPath.item]
            cell.configure(for: prof)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushProfDetailsViewController()
    }
}


extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width  * 0.3
        return CGSize(width: width, height: height)
    }
}
