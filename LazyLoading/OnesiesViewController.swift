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
    var images: [UIImage] = []
    let group = DispatchGroup()
    
    let urlString = "https://picsum.photos/146/375/?random"

   
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("fired end")
        print(images.count)
        print(!fetching)
        if indexPath.row == images.count - 1 {

            let url = URL(string: urlString)
            
            fetchImageWithUrl(url: url!)
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.cellImage.image = images[indexPath.row]
        return cell
    }
    

    func fetchImageWithUrl(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, res, err) in
//            let data = try? Data(contentsOf: url)
            self.images.append(UIImage(data: data!)!)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: urlString)
        
        group.enter()
        for _ in 1...10 {
            fetchImageWithUrl(url: url!)
        }
        group.leave()
        group.wait()
            print(images)
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
