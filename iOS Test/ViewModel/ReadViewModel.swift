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
import FirebaseStorage

class ReadViewModel: ObservableObject{
    var ref: DatabaseReference! = Database.database().reference()
    var storage = Storage.storage()
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
                  // Create a storage reference from the URL
                  let storageRef = self.storage.reference(forURL: url)
                  
                 
                  DispatchQueue.global().async {
                  storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                      if error != nil {
                          print("Error: Image could not download!")
                      } else {
                          
                              self.object = ImageObject()
                              self.object?.id = id
                              let image = UIImage(data: data!)
                              self.object?.image = image
                              if self.object != nil {
                                  self.listObject.append(self.object!)
                              }
//                              print(image)
                      }
                  }
              }
                  print(storageRef)
              }
          })
    }
}
