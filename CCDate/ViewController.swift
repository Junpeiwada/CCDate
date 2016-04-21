//
//  ViewController.swift
//  CCDate
//
//  Created by junpeiwada on 2016/04/21.
//  Copyright © 2016年 soneru. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSWindowDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let array = NSArray.init(object: NSFilenamesPboardType)
        self.view.registerForDraggedTypes(array as! [String])
        
        self.view.window?.delegate = self

    }

    func windowWillClose(aNotification : NSNotification){
        // Windowが閉じたらアプリを終了するようにする
        NSApp.terminate(self)
    }
}

