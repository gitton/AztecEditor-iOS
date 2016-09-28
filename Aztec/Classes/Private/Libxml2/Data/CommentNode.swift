import Foundation

extension Libxml2 {
    /// Comment nodes use to hold HTML comments like this: <!-- This is a comment -->
    ///
    class CommentNode: Node, LeafNode {

        var comment: String

        init(text: String) {
            comment = text

            super.init(name: "comment")
        }

        override func customMirror() -> Mirror {
            return Mirror(self, children: ["type": "comment", "name": name, "comment": comment, "parent": parent.debugDescription], ancestorRepresentation: .Suppressed)
        }

        /// Node length.
        ///
        override func length() -> Int {
            return text().characters.count
        }
        
        // MARK: - LeafNode
        
        override func text() -> String {
            return "\n"
        }
    }
}
