//
//  ReadViewModel.swift
//  iOS Test
//
//  Created by Sazza on 10/6/22.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import Firebase

class ReadViewModel: ObservableObject{
    var ref: DatabaseReference! = Database.database().reference()
    @Published var object: ImageObject? = nil
    
    @Published var listObject = [ImageObject]()

    func observeListObject() {
        
        let carousel = self.ref.child("carousel")

        carousel.observeSingleEvent(of: .value, with: { snapshot in
              for child in snapshot.children {
                  let snap = child as! DataSnapshot
                  let placeDict = snap.value as! [String: Any]
                  let id = placeDict["id"] as! Int
                  let url = placeDict["url"] as! String
                  //print(id, url)
                  self.object = ImageObject()
                  self.object?.id = id
                  self.object?.url = url
                  if self.object != nil {
                      self.listObject.append(self.object!)
                  }
              }
            print(self.listObject)
          })
    }
}
