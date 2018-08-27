//
//  ThreesiesViewController.swift
//  LazyLoading
//
//  Created by Tyler Walker on 8/25/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ThreesiesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("threesies")
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWasShown() {
        print("shown")
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
