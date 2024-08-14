//
//  String+Extension.swift
//  NewsDisplay
//
//  Created by Victor Ulloa on 2024-08-14.
//

import Foundation

extension String {
    static func formatAuthors(_ authors: [String]) -> String {
        switch authors.count {
        case 0:
            return ""
        case 1:
            return authors[0]
        case 2:
            return "\(authors[0]) and \(authors[1])"
        default:
            let lastAuthor = authors.last ?? ""
            let otherAuthors = authors.dropLast()
            let formattedOtherAuthors = otherAuthors.joined(separator: ", ")
            return "\(formattedOtherAuthors) and \(lastAuthor)"
        }
    }
}
