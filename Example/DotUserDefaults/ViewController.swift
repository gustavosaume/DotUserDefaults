//
//  ViewController.swift
//  DotUserDefaults
//
//  Created by Gustavo Saume on 05/07/2016.
//  Copyright (c) 2016 Gustavo Saume. All rights reserved.
//

import UIKit
import DotUserDefaults

enum MyDefaults: String {
  case WelcomeText = "welcomeText"
}

enum WelcomeText: String {
  case Hai = "👋"
  case Cheers = "🍻"
  case Cool = "👌"

  var next: WelcomeText {
    switch self {
      case .Hai: return .Cheers
      case .Cheers: return .Cool
      case .Cool: return .Hai
    }
  }
}


class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel! {
    didSet {
      let message:WelcomeText = NSUserDefaults.standardUserDefaults().enumForKey(MyDefaults.WelcomeText) ?? WelcomeText.Hai
      label.text = message.rawValue

      // update defaults
      NSUserDefaults.standardUserDefaults().setEnum(message.next, forKey: MyDefaults.WelcomeText)
    }
  }
}
