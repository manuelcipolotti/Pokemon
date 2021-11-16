//
//  LanguageManager.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 15/11/21.
//

import Foundation

let DEFAULT_LANGUAGE = "en"

struct Language {
    let name: String
    let value: String
}


func localize(_ key: String) -> String{
    return NSLocalizedString(key, tableName: nil, bundle: LanguageManager.instance.bundle!, value: "", comment: "")
}

class LanguageManager: NSObject{
    static let instance = LanguageManager()
    
    var language : String!
    var bundle : Bundle!
    
    override init() {
        super.init()
        
        //if language was previously setted take last setting
        if let lastSetting = UserDefaults.standard.string(forKey: "language"){
            language = lastSetting
        } else {
            //set to system language if supported
            if LanguageManager.isSupported(language: Locale.current.languageCode!){
                language = Locale.current.languageCode!
            } else {
                //otherwise set to english
                language = DEFAULT_LANGUAGE
            }
        }
        
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        bundle = Bundle(path: path)
        UserDefaults.standard.set(language, forKey: "language")
        
    }
    
    static func isSupported(language: String)->Bool{
        return Bundle.main.path(forResource: language, ofType: "lproj") != nil
    }

    static func localize(_ key: String,
                         placeHolder: String? = nil) -> String{
        if let ph = placeHolder {
            let localizedString = NSLocalizedString(key, tableName: nil, bundle: LanguageManager.instance.bundle!, value: "", comment: "")
            return String(format: localizedString, ph)
        } else {
            return NSLocalizedString(key, tableName: nil, bundle: LanguageManager.instance.bundle!, value: "", comment: "")
        }

    }

    
    static func localize(_ key: String,
                         placeHolders: CVarArg...) -> String{
        let localizedString = NSLocalizedString(key, tableName: nil, bundle: LanguageManager.instance.bundle!, value: "", comment: "")
        return String(format: localizedString, placeHolders)

    }
    
    static func localize(_ key: String,
                         placeHolder1: String,
                         placeHolder2: String,
                         placeHolder3: String) -> String{
        let localizedString = NSLocalizedString(key, tableName: nil, bundle: LanguageManager.instance.bundle!, value: "", comment: "")
        return String(format: localizedString, placeHolder1, placeHolder2, placeHolder3)

    }

    static func setLanguage(language: String){
        
        if(LanguageManager.isSupported(language: language)){
            LanguageManager.instance.language = language
            if let path = Bundle.main.path(forResource: LanguageManager.instance.language, ofType: "lproj"){
                LanguageManager.instance.bundle = Bundle.init(path: path)
                UserDefaults.standard.set(language, forKey: "language")
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    static func getLanguage()-> String {
        let a = LanguageManager.instance.language!
        return a
    }
}
