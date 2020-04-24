import Foundation

public final class CommitWithBranchName {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        if CommandLine.argc < 2 {
            print(GitError.noMessage.localizedDescription)
        } else {
            let commitMessage = Array(CommandLine.arguments[1...]).joined(separator: " ")
            commit(with: commitMessage)
        }
    }
    
    private func commit(with message: String) {
        Git.currentBranchName.execute(onSuccess: { branchName in
            Git.commit.execute(with: ["\"\(branchName) \(message)\""])
        })
    }
}
