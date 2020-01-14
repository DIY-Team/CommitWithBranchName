import Foundation

public final class CommitWithBranchName {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    //git rev-parse --abbrev-ref HEAD

    
    public func run() throws {
        let bash = Bash()
        guard let branchName = bash.execute(commandName: "git", arguments: ["rev-parse", "--abbrev-ref", "HEAD"])?.trimmingCharacters(in: NSCharacterSet.newlines) else {
            return
        }
        if CommandLine.argc < 2 {
            let commitMessage = "\(branchName) no message"
            print("The commit message is: \(commitMessage)")
            print(bash.execute(commandName: "git", arguments: ["commit", "-m", commitMessage]) ?? "")
        } else {
            var message = CommandLine.arguments
            message.remove(at: 0)
            let commitMessage = "\(branchName) \(message.joined(separator: " "))"
            print("The commit message is: \(commitMessage)")
            print(bash.execute(commandName: "git", arguments: ["commit", "-m", commitMessage]) ?? "")
        }
    }
}
