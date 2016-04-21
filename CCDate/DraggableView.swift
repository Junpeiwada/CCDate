//
//  DraggableView.swift
//  CCDate
//
//  Created by junpeiwada on 2016/04/21.
//  Copyright © 2016年 soneru. All rights reserved.
//

import Cocoa

class DraggableView: NSView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let array = NSArray.init(object: NSFilenamesPboardType)
        self.registerForDraggedTypes(array as! [String])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let array = NSArray.init(object: NSFilenamesPboardType)
        self.registerForDraggedTypes(array as! [String])
    }
    
    override func draggingEntered(sender: NSDraggingInfo) -> NSDragOperation {
        NSLog("Drag entered\n")
        return NSDragOperation.Every
    }
    
    override func draggingUpdated(sender: NSDraggingInfo) -> NSDragOperation {
        NSLog("draggingUpdated\n")
        return NSDragOperation.Every
    }
    
    override func draggingExited(sender: NSDraggingInfo?) {
        NSLog("draggingUpdated\n")
    }
    
    override func performDragOperation(sender: NSDraggingInfo) -> Bool {
        
        let pb = sender.draggingPasteboard()
        
        let filePaths = pb.propertyListForType(NSFilenamesPboardType)
        
        
        let names =  filePaths as? NSArray
        for na in names! {
            
            let path = na as! String
            let attributes : Dictionary = try! NSFileManager.defaultManager().attributesOfItemAtPath(path)
            let createDate  = attributes[NSFileCreationDate] as! NSDate
            
            
            NSLog("performDragOperation\n" + path + "  :  " + createDate.description)
                        
            let newCreateDate = createDate.dateByAddingTimeInterval(60 * 60 * 9)
            
            let newAtt: Dictionary = [NSFileCreationDate: newCreateDate]
            
            
            do {
                try NSFileManager.defaultManager().setAttributes(newAtt, ofItemAtPath: path)
            }catch{
                NSLog("エラーだよ")
            }
        }
        
        return true
    }
}
