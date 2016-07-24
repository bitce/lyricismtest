//
//  SwiftyiTunes.swift
//  LyriKing
//
//  Created by Stan Liu on 28/06/2016.
//  Copyright © 2016 Stan Liu. All rights reserved.
//

import Cocoa
import Foundation
import ScriptingBridge
import iTunesScripting

class SwiftyiTunes: NSObject {

    static let sharedInstance: SwiftyiTunes = SwiftyiTunes()
    
    override init() {
        super.init()
        
    }
    
    let iTunes: iTunesApplication = {
        
        return SBApplication(bundleIdentifier: "com.apple.iTunes") as! iTunesApplication
    }()
}