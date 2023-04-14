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

After installing the module, you will need to modify your PowerShell profile script to import the module automatically and make the aliases available in your PowerShell sessions.

To make this easier, we have created a script called `EnablePSGitHubCopilotCLIAliases.ps1` that adds the necessary import statement to your PowerShell profile in an idempotent manner. The script is hosted on the PSGitHubCopilotCLI GitHub repository.

You can run the script directly from the GitHub repository by executing the following command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/yveslaurentcreton/PSGitHubCopilotCLI/develop/scripts/EnablePSGitHubCopilotCLIAliases.ps1'))
```

This command will download and execute the `EnablePSGitHubCopilotCLIAliases.ps1` script from the GitHub repository. After running this command, you can open a new PowerShell session, and the PSGitHubCopilotCLI module will be imported, making the aliases available for use.

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

This project is licensed under the [MIT License](https://github.com/yveslaurentcreton/PSGitHubCopilotCLI/blob/main/LICENSE).
