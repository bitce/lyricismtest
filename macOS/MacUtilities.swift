//
//  MacUtilities.swift
//  macOS
//
//  Created by Stan Liu on 17/06/2016.
//  Copyright © 2016 Stan Liu. All rights reserved.
//

import Cocoa
import ScriptingBridge
import MediaLibrary
import SwiftyJSON

@objc protocol iTunesApplication {
    optional func currentTrack()-> AnyObject
    optional var properties: NSDictionary {get}
    //if you need another object or method from the iTunes.h, you must add it here
}

struct PlayingTrack {
    
    var track = ""
    var artist = ""
    var album = ""
    var time = ""
}

class MacUtilities: NSObject {
    
    class func getCurrentMusicInfo() -> PlayingTrack? {
        
        let iTunesApp: AnyObject = SBApplication(bundleIdentifier: MLMediaSourceiTunesIdentifier)!
        let trackDict = iTunesApp.currentTrack!().properties as Dictionary
        if trackDict["name"] != nil { // if nil then no current track
            print(trackDict["name"]!) // print the title
            print(trackDict["artist"]!)
            print(trackDict["album"]!)
            print(trackDict["playedCount"]!)
            // print(trackDict) // print the dictionary
            if let track = trackDict["name"] as? String,
                artist = trackDict["artist"]as? String,
                album = trackDict["album"] as? String,
                time = trackDict["time"] as? String {
                
                let playingTrack = PlayingTrack(track: track, artist: artist, album: album, time: time)
                
                return playingTrack
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
