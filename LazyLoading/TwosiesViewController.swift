//
//  TwosiesViewController.swift
//  LazyLoading
//
//  Created by Tyler Walker on 8/25/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit


class TwosiesViewController: UIViewController, PopulateTwosiesDelegate {
    var delegate: UIViewController? = nil
    var textData: String?

    @IBOutlet weak var dataLabel: UILabel!
    
    func sendImageData(text: String) {
        self.textData = text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let onesiesVC = OnesiesViewController()
        self.delegate? = onesiesVC
        
        self.dataLabel?.text = self.textData!
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
