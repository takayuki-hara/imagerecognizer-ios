//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `Settings.bundle`.
    static let settingsBundle = Rswift.FileResource(bundle: R.hostingBundle, name: "Settings", pathExtension: "bundle")
    
    /// `bundle.url(forResource: "Settings", withExtension: "bundle")`
    static func settingsBundle(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.settingsBundle
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `launch`.
    static let launch = Rswift.ImageResource(bundle: R.hostingBundle, name: "launch")
    /// Image `no_image`.
    static let no_image = Rswift.ImageResource(bundle: R.hostingBundle, name: "no_image")
    /// Image `test_image`.
    static let test_image = Rswift.ImageResource(bundle: R.hostingBundle, name: "test_image")
    
    /// `UIImage(named: "launch", bundle: ..., traitCollection: ...)`
    static func launch(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.launch, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "no_image", bundle: ..., traitCollection: ...)`
    static func no_image(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.no_image, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "test_image", bundle: ..., traitCollection: ...)`
    static func test_image(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.test_image, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `ResultTableViewCell`.
    static let resultTableViewCell = _R.nib._ResultTableViewCell()
    
    /// `UINib(name: "ResultTableViewCell", in: bundle)`
    static func resultTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.resultTableViewCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `resultCell`.
    static let resultCell: Rswift.ReuseIdentifier<ResultTableViewCell> = Rswift.ReuseIdentifier(identifier: "resultCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `TopViewController`, and contains static references to 1 segues.
    struct topViewController {
      /// Segue identifier `toResultSegue`.
      static let toResultSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, TopViewController, ResultViewController> = Rswift.StoryboardSegueIdentifier(identifier: "toResultSegue")
      
      /// Optionally returns a typed version of segue `toResultSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func toResultSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, TopViewController, ResultViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.topViewController.toResultSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _ResultTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ResultTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "resultCell"
      let name = "ResultTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> ResultTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ResultTableViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "launch") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'launch' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if UIKit.UIImage(named: "no_image") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'no_image' is used in storyboard 'Main', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
