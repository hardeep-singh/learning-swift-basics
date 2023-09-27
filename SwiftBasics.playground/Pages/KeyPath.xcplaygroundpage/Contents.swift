//: [Previous](@previous)

import Foundation

/*: # What is KeyPath
 KeyPath is a type that represent a references to properties
   ### KKey paths come in three main variants:
- KeyPath: Provides read-only access to a property.
- WritableKeyPath: Provides readwrite access to a mutable property with value semantics (so the instance in question also needs to be mutable for writes to be allowed).
- ReferenceWritableKeyPath: Can only be used with reference types (such as instances of a class), and provides readwrite access to any mutable property.
 */

//: - 1
struct Article {
    var title: String = ""
    var detail: String = ""
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }
}
//: - 2
let keyPath: KeyPath<Article, String> = \Article.title
let detailKeyPath: WritableKeyPath<Article, String> = \Article.detail

var articleObj = Article(title: "Titleee", detail: "Detail")

//let detailKeyPath: ReferenceWritableKeyPath<Article, String> = \Article.detail

 //: - 3
articleObj[keyPath: detailKeyPath] = "Detaill key path update value"
//:  - 4
print(articleObj[keyPath: keyPath])
print(articleObj[keyPath: detailKeyPath])
