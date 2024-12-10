# Setup for ZSH Configuration

This repository contains a custom `.zshrc` configuration for Zsh users. To make everything work as intended, follow the steps below to install necessary tools and dependencies.

## Requirements

To use this configuration, you'll need to install the following tools:

1. **Zsh** - Zsh shell
2. **Oh My Zsh** - A framework for managing Zsh configurations
3. **Powerlevel10k** - A theme for Zsh that improves the shell prompt
4. **Homebrew** - A package manager for macOS (if you're on macOS)
5. **Plugins** - `git`, `zsh-syntax-highlighting`, `fnm`, `ng-cli`
6. **Anaconda** (Optional, if you need Python environments)

### Installation Steps

#### 1. Install Zsh
Make sure you have Zsh installed. You can check if Zsh is installed by running the following command:

```bash
zsh --version
```

If it's not installed, you can install it via Homebrew:

```bash
brew install zsh
```

#### 2. Install Oh My Zsh

To install **Oh My Zsh**, run the following command:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### 3. Install Powerlevel10k Theme

Powerlevel10k is a Zsh theme that provides a beautiful and fast prompt. To install it:

```bash
# Clone the Powerlevel10k repository into the custom themes directory for Oh My Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Set Powerlevel10k as your theme in ~/.zshrc
# Add or change this line:
ZSH_THEME="powerlevel10k/powerlevel10k"
```

#### 4. Install Plugins

- **git plugin**: This comes bundled with Oh My Zsh.
  
- **zsh-syntax-highlighting**: To install the `zsh-syntax-highlighting` plugin, run:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- **fnm (Fast Node Manager)**: To manage Node.js versions, install `fnm`:

```bash
brew install fnm
```

- **Angular CLI Autocompletion**: To enable Angular CLI autocompletion, you'll need to have Angular CLI installed. If you haven't installed Angular CLI yet, do so by running:

```bash
npm install -g @angular/cli
```

#### 5. Install Anaconda (Optional)

If you're using Anaconda for managing Python environments, download and install Anaconda from their [official site](https://www.anaconda.com/products/individual).

Once installed, add the following line to your `.zshrc` to lazy-load Conda:

```bash
# Lazy-load Conda
_conda_lazy_init() {
  unset -f conda
  source "/path/to/anaconda3/etc/profile.d/conda.sh"
}
alias conda="_conda_lazy_init; conda"
```

Make sure to replace `/path/to/anaconda3/` with the correct path.

#### 6. Additional Configuration

- **Editor Configuration**: The default editor is set based on whether you're connecting via SSH. If you're on a local machine, it will use `mvim` (MacVim). If you're using SSH, it defaults to `vim`. You can modify the `EDITOR` environment variable if needed.

```bash
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
```

- **Docker**: If you're using Docker, the `DOCKER_DEFAULT_PLATFORM` is set to `linux/amd64` for compatibility with ARM-based Macs. You can change this if needed.

```bash
export DOCKER_DEFAULT_PLATFORM=linux/amd64
```

- **Path adjustments**: Make sure to add any additional paths specific to your environment to the `PATH` variable.

```bash
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/openssl@1.1/bin:$HOME/.cargo/bin:$HOME/bin:$PATH"
```

### Usage

1. Clone the repository:
   
   ```bash
   git clone https://github.com/your-username/your-repository.git
   ```

2. Copy the `.zshrc` configuration file to your home directory:

   ```bash
   cp your-repository/.zshrc ~/
   ```

3. Reload Zsh or open a new terminal:

   ```bash
   source ~/.zshrc
   ```

4. Enjoy your custom Zsh environment!

### Troubleshooting

- If you encounter issues with **Powerlevel10k**, make sure your terminal supports true color.
- If the **Angular CLI** completion is not working, ensure you have the Angular CLI installed globally with `npm install -g @angular/cli`.
- If **fnm** does not work as expected, make sure to add the necessary initialization in your `.zshrc`:

   ```bash
   eval "$(fnm env --use-on-cd --log-level=quiet)"
   ```

For more details on setting up or troubleshooting each component, refer to their respective documentation:

- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)
- [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [FNM - Fast Node Manager](https://github.com/Schniz/fnm)

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
