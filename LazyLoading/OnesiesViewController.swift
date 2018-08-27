//
//  OnesiesViewController.swift
//  LazyLoading
//
//  Created by Tyler Walker on 8/25/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
}

class OnesiesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataCount: Int = 10
    var fetching: Bool = false
   
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == dataCount - 1 && !fetching {  //numberofitem count
            dataCount = dataCount + 1
            collectionView.reloadData()
            fetching = true
            debounceRowFetch(seconds: 3)
        }
    }
    
    func debounceRowFetch(seconds: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.fetching = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let urlString = "https://picsum.photos/200/300/?random"
        let url = URL(string: urlString)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        fetchImageWithUrl(cellImage: cell.cellImage, url: url!)
        
        return cell
    }
    
    func fetchImageWithUrl(cellImage: UIImageView?, url: URL) {
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                cellImage?.image = UIImage(data: data!)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("onesies")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
