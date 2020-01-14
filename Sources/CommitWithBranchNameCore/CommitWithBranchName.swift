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
            print("The commit message is: \(branchName) no message")
        } else {
            print("Arguments are passed.")
            var message = CommandLine.arguments
            message.remove(at: 0)
            print("The commit message is: \(branchName) \(message.joined(separator: " "))")
        }
    }
}
