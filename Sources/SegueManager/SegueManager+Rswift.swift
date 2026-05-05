//
//  SegueManager+Rswift.swift
//  Q42
//
//  Created by Tom Lokhorst on 2015-12-05.
//
//

import UIKit
import RswiftResources

@MainActor
extension SeguePerformer {
  public func performSegue<Segue, Destination>(
    withIdentifier segueIdentifier: SegueIdentifier<Segue, Self, Destination>,
    handler: @escaping (TypedSegue<Segue, Self, Destination>) -> Void)
  {
    segueManager.performSegue(withIdentifier: segueIdentifier.identifier) { segue in

        if let typedInfo = TypedSegue(segueIdentifier: segueIdentifier, uiStoryboardSegue: segue) {
        handler(typedInfo)
      }
      else {
        let message = "Performing R.segue.???.\(segueIdentifier.identifier), "
          + "however not all types match up.\n"
          + "Requested: Segue: \(Segue.self), Source: \(Self.self), Destination: \(Destination.self).\n"
          + "Actual: Segue: \(type(of: segue)), Source: \(type(of: segue.source)), Destination: \(type(of: segue.destination))."

        fatalError(message)
      }
    }
  }

  public func performSegue<Segue, Destination>(
    withIdentifier segueIdentifier: SegueIdentifier<Segue, Self, Destination>)
  {
    performSegue(withIdentifier: segueIdentifier) { _ in }
  }
}

extension TypedSegue where Source : SeguePerformer {
  public func performSegue(
    handler: @escaping (TypedSegue<Segue, Source, Destination>) -> Void)
  {
    self.source.segueManager.performSegue(withIdentifier: self.identifier) { segue in

    handler(self)
    }
  }
}
