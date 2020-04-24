//
//  Git.swift
//  CommitWithBranchName
//
//  Created by Vishal Singh on 24/04/20.
//

import Foundation
import RunsShellCommand

enum GitError: Error {
    case noMessage
    case noBranch
    
    var localizedDescription: String {
        switch self {
        case .noMessage: return "No commit message provided. Please provide a commit message."
        case .noBranch: return "Could not identify current working branch. Please, make sure you are working in valid git repo with a valid branch/HEAD"
        }
    }
}

enum Git: AnyShellCommand {
    case currentBranchName
    case commit
    
    var command: String {
        get {
            return "git"
        }
        set {}
    }
    
    var defaultArguments: [String] {
        get {
            switch self {
            case .currentBranchName: return ["rev-parse", "--abbrev-ref", "HEAD"]
            case .commit: return ["commit", "-m"]
            }
        }
        set {}
    }
}
