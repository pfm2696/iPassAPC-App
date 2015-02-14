//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Peter & Liz  on 2/12/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let url = NSURL(string:"http://ipassapcomp.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
            (data, response, error) in
            
            if error == nil {
                
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                    println(urlContent)
                
                dispatch_async(dispatch_get_main_queue()) {
                
                    self.webView.loadHTMLString(urlContent!, baseURL: nil)
                }
           
            }
                
        
        }
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

