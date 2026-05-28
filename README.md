# julia_envs

A command-line utility written in Ruby to manage, document, and interact with Julia named environments. 

---

## Understanding Julia Environments

To understand why `julia_envs` is useful, it is helpful to compare the three ways Julia handles package environments:

### 1. The Global Environment (`@v1.x`)
By default, if you do not specify a project directory, Julia runs in the global environment.
* **The Problem**: Installing all packages globally eventually leads to **"Dependency Hell."** Different packages specify strict compatibility bounds (e.g., Package A requires `DataFrames v0.22` or older, while Package B requires `DataFrames v1.0` or newer). Over time, your package manager will reach a version conflict deadlock, refusing to install or update any more packages.

### 2. Local Directory Environments (`--project=.`)
A local environment is created within a specific directory, tracking dependencies in local `Project.toml` and `Manifest.toml` files.
* **The Problem**: While this is the standard for reproducible research or shared repositories, it adds repetitive overhead for single-file scripts or quick calculations. You must create a new folder, initialize a project, and manually run `Pkg.add()` for basic packages every time, creating unnecessary directory clutter.

### 3. Shared Named Environments (The Hybrid Solution)
A named environment (e.g., `@plotting` or `@data`) is an isolated environment stored globally under `~/.julia/environments/`.
* **Why They Are Useful**: They represent the ideal compromise. You can group related workflows into shared, isolated environments (e.g., putting `Plots` and `Cairo` inside `@plotting`, and `DataFrames` and `CSV` inside `@data`). 
  - They keep your global environment clean, preventing version conflicts.
  - They eliminate the need to create localized project folders for every quick script you write.
  - They execute and compile **instantly** because the package versions are globally resolved and cached once.

---

## Features

- **List Environments**: Display all existing Julia named environments along with custom user-defined descriptions.
- **Show Environment Details**: View all direct dependencies (packages) registered in a specific named environment.
- **Add Packages**: Add one or more packages to a named environment.
- **Describe Environment**: Add or update a text description in an environment's `Project.toml` to help document its purpose.
- **Create from Script**: Scan a Julia script for `using` or `import` statements, extract all required packages, and automatically build a new named environment with those dependencies.
- **Match Script to Environments**: Scan a Julia script and identify which of your existing named environments have enough registered packages to run it.
- **Match and Run Script (mrun)**: Scan a Julia script, automatically find an existing named environment that satisfies its dependencies, and run the script in it.
- **Run Script**: Execute a Julia script directly using a specific named environment.
- **Launch REPL**: Start an interactive Julia REPL session inside a named environment.
- **Remove Environment**: Delete an unwanted named environment with interactive confirmation.
- **Search Registry**: Search the General Julia package registry to check for available package names.

---

## Installation

Ensure `julia` and `ruby` are installed and available in your system path.

1. Clone or copy the `julia_envs` script to a directory in your system path (e.g., `/usr/local/bin/`).
2. Make it executable:
   ```bash
   chmod +x julia_envs
   ```

---

## Usage

```bash
julia_envs list                            List all environments and descriptions
julia_envs show <env_name>                 Show registered packages in an environment
julia_envs add <env_name> <pkg1> <pkg2>..  Add packages to a named environment
julia_envs describe <env_name> "<desc>"    Add/change description of an environment
julia_envs create <env_name> <script.jl>   Create an environment from a Julia script
julia_envs match <script.jl>               Find environments that can run a script
julia_envs mrun <script.jl> [args...]      Run a Julia script in a matching named env
julia_envs run <env_name> <script.jl> [..] Run a Julia script in a named environment
julia_envs repl <env_name>                 Launch Julia REPL in a named environment
julia_envs rm <env_name>                   Delete a named environment
julia_envs search <query>                  Search General Registry for a package
```

---

## Development & Maintenance

This program was created using **antigravity-cli**.
