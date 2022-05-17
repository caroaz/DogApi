

import Foundation
protocol ImageListView: AnyObject {
    func display (_ list : [ImageViewModel])
    func displayError()
}
