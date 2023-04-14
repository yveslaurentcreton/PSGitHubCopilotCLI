# PSGitHubCopilotCLI

PSGitHubCopilotCLI is a PowerShell module that provides integration with the GitHub Copilot CLI on Windows. It allows users to run GitHub Copilot CLI functions directly from their PowerShell sessions.

## Prerequisites

1. Ensure your GitHub account has access to the [technical preview of GitHub Copilot CLI](https://githubnext.com/projects/copilot-cli).
2. Install the GitHub Copilot CLI by following the instructions on the [official npm package page](https://www.npmjs.com/package/@githubnext/github-copilot-cli).

## Installation

You can install the PSGitHubCopilotCLI module from the PowerShell Gallery using the following command:

```powershell
Install-Module -Name PSGitHubCopilotCLI -AllowPrerelease
```

## Usage

Once installed, you can use the functions provided by the PSGitHubCopilotCLI module in your PowerShell session. The module includes the following functions:

- `Invoke-GitHubCopilotWhatTheShell` (aliases: `??`, `wts`)
- `Invoke-GitHubCopilotGitAssist` (alias: `git?`)
- `Invoke-GitHubCopilotGhAssist` (alias: `gh?`)
To use a function, simply call it with the required arguments. For example:

```powershell
?? create a new folder called "my-folder"
```

## Contributing

We welcome contributions to the PSGitHubCopilotCLI project! If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make the desired changes in your branch.
4. Commit and push your changes to your fork.
5. Create a pull request to the main repository.

Please ensure your changes adhere to the existing coding style and that your commits have clear, descriptive messages.

### Reporting Issues

If you encounter any issues or have suggestions for improvements, please [open an issue](https://github.com/yveslaurentcreton/PSGitHubCopilotCLI/issues) in the GitHub repository. Be sure to provide a clear description of the issue and any relevant information to help us understand and reproduce the problem.

### Feature Requests

We're always open to new ideas! If you have a feature request, please [open an issue](https://github.com/yveslaurentcreton/PSGitHubCopilotCLI/issues) and describe the feature, explaining how it would benefit users of the PSGitHubCopilotCLI module.

## License

This project is licensed under the MIT License.