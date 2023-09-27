//: [Previous](@previous)
/*: # What is an OptionSet?
TheOptionSet protocol allows you to define available configuration options for a specific type or method. It’s commonly used in the standard libraries, for example, when parsing JSON in Swift
 */
struct UploadOptions: OptionSet {
    let rawValue: UInt
    static let option1 = UploadOptions(rawValue: 1)
    static let option2 = UploadOptions(rawValue: 2)
    static let option3 = UploadOptions(rawValue: 3)
}

/* ### Reading values from an OptionSet*/

func checkValues(options: UploadOptions) {
    if options.contains(.option1) {
    }
}

checkValues(options: [.option1,.option2,.option3])



//: [Next](@next)

let rain = #"The "rain" in "Spain" falls mainly on the Spaniards."#

