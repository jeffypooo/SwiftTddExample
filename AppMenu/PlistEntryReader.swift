//
//  PListEntryReader.swift
//  AppMenu
//
//  Created by Jeff Jones on 12/9/15.
//  Copyright © 2015 Jeff Jones. All rights reserved.
//

import Foundation

public class PlistEntryReader: EntryReader {
    
    public static let ErrorDomain = "PlistEntryReaderErrorDomain"
    
    public enum ReadError : Int {
        case FileNotFound
    }
    
    public func readItems(fileName: String) -> ([[String : String]]?, NSError?) {
        var err: NSError? = nil
        var fileContents: [[String : String]]? = nil
        
        let bundle: NSBundle = NSBundle(forClass: object_getClass(self))
        
        if let filePath = bundle.pathForResource(fileName, ofType: "plist") {
            fileContents = NSArray(contentsOfFile: filePath) as? [[String : String]]
        } else {
            let desc = getErrorDescriptionForFileNotFound(fileName)
            let info = [NSLocalizedDescriptionKey : desc]
            err = NSError(domain: PlistEntryReader.ErrorDomain,
                code: ReadError.FileNotFound.rawValue,
                userInfo: info
            )
        }
    
        return (fileContents, err)
    }
    
    private func getErrorDescriptionForFileNotFound(badFile: String) -> String {
        return "\(badFile).plist does not exist in app bundle."
    }
}
