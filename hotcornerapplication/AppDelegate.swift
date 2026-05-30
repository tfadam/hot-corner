//
//  AppDelegate.swift
//  hotcornerapp
//
//  Created by Timo Adam on 8/3/16.
//  Copyright © 2016 Timo Adam. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let scrn: NSScreen = NSScreen.main!
        let rect: NSRect = scrn.frame
        let ydim = rect.size.height
        let xdim = rect.size.width
        let home_path = "http://ds.local/tfadam/"
        
        window.acceptsMouseMovedEvents = true
        
        var neutral = true
        
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.mouseMoved, handler: {(event: NSEvent) in
            
            var loc: NSPoint {
                return NSEvent.mouseLocation
            }
            
            if loc.x>10 && loc.x<xdim-10 && loc.y>10 && loc.y<ydim-10 && !neutral {
                
                neutral = true
            }
            
            if neutral {
                
                if loc.x<1 && loc.y<1 {
                    
                    neutral = false
                    
                    if event.modifierFlags.contains(.command) {
                        
                        NSWorkspace.shared.launchApplication("Notes")
                    }
                    
                    if event.modifierFlags.contains(.function) {
                        
                        NSWorkspace.shared.open(URL(string: home_path)!)
                    }
                }
                
                if loc.x>xdim-1 && loc.y<1 {
                    
                    neutral = false
                    
                    if event.modifierFlags.contains(.command) {
                        
//                        NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/Calendar.app"))
                        NSWorkspace.shared.launchApplication("Calendar")

                        //NSWorkspace.shared().open(URL(string: "https://maps.google.com")!)
                    }
                    
                    if event.modifierFlags.contains(.function) {
                        
                        NSWorkspace.shared.open(URL(string: home_path)!)
                    }
                }
                
                if loc.x<1 && loc.y>ydim-1 {
                    
                    neutral = false
                    
                    if event.modifierFlags.contains(.command) {
                        
                        NSWorkspace.shared.open(URL(string: "https://mail.google.com")!)
                    }
                    
                    if event.modifierFlags.contains(.function) {
                        
                        NSWorkspace.shared.open(URL(string: home_path)!)
                    }
                }
                
                if loc.x>xdim-1 && loc.y>ydim-1 {
                    
                    neutral = false
                    
                    if event.modifierFlags.contains(.command) {
                        
                        NSWorkspace.shared.launchApplication("Mail")
                    }
                    
                    if event.modifierFlags.contains(.function) {
                        
                        NSWorkspace.shared.open(URL(string: home_path)!)
                    }
                }
            }
        })
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
}
