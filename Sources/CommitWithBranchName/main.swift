import CommitWithBranchNameCore

let tool = CommitWithBranchName()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
