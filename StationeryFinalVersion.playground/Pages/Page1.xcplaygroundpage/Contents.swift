/*:
 # Stationery
 ### Page Navigation
 * [Page 2](Page2)
 * [Page 3](Page3)
 * [Page 4](Page4)
 */

import SwiftUI
import PlaygroundSupport

let fontUrl = Bundle.main.url(forResource: "East Coast Stationery", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(fontUrl, CTFontManagerScope.process, nil)

struct story: View {
    var body:  some View {
        controller()
    }
}
PlaygroundPage.current.setLiveView(story())

//: **Click here to go to the next page:**
//: [Next](@next)
