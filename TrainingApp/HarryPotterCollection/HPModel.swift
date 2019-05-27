import UIKit

struct HPChars: Decodable{
    var name: String?
    var house: String?
    var dateOfBirth: String?
    var actor: String?
    var image: String?
    var ancestry: String?
    var wand: Wand?
    
    struct Wand : Decodable {
        var wood: String?
        var core: String?
        // var length: Double?
    }
    
    
    
}
