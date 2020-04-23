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

public final class CommitWithBranchName {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        if CommandLine.argc < 2 {
            throw(GitError.noMessage)
        } else {
            let commitMessage = Array(CommandLine.arguments[1...]).joined(separator: " ")
            commit(with: commitMessage)
        }
    }
    
    private func commit(with message: String) {
        Git.currentBranchName.execute(onSuccess: { branchName in
            Git.commit.execute(with: [branchName])
        })
    }
}
