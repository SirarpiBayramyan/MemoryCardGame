//
//  ThemeCooserViewController.swift
//  memoryCardGame
//
//  Created by Sirarpi on 9/17/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import UIKit

class ThemeCooserViewController: UIViewController, UISplitViewControllerDelegate {
    
    let themes = [
        "Fruits":"🍌🥥🍊🍓🍇🍒🍐🥝🍏🍍",
        "Sports":"⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🏓🏸⛸🥋🎽",
        "Flags":"🇦🇲🇬🇪🇬🇷🇦🇷🇦🇺🇧🇷🇨🇰🇮🇹🇫🇷🇱🇷🇳🇮🇷🇺🇸🇰🇺🇸🇬🇧🏴󠁧󠁢󠁥󠁮󠁧󠁿🇪🇸"
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? MemoryGameViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show", let themeName = (sender as? UIButton)?.currentTitle,let theme = themes[themeName] {
            if let cvc = segue.destination as? MemoryGameViewController{
                cvc.theme = theme
                lastSeguedToMemoryViewController = cvc
            }
        }
    }
    
    @IBAction func changeTheme(_ sender: UIButton) {
        if let cvc = splitDetailGameViewController{
            
            if let themeName = sender.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        }else if let cvc = lastSeguedToMemoryViewController {
            if let themeName = sender.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        }else{
            performSegue(withIdentifier: "Show", sender: sender)
        }
    }
    
    var splitDetailGameViewController: MemoryGameViewController?
    {
        return splitViewController?.viewControllers.last as? MemoryGameViewController
    }
    var lastSeguedToMemoryViewController:MemoryGameViewController?
}
