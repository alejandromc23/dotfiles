# Dotfiles Repository

Welcome to my dotfiles repository! Here you will find all the configurations and settings that I use on my Linux machine.

## Supported Operating Systems

Currently, the dotfiles are only prepared for Linux, but who knows... That's why there's a folder called `os`. 

## Folder Structure

This repository follows a specific folder structure to organize the configuration files. Below is an explanation of each folder:

- `.config`: This folder contains some application configurations. If it is located at the root of the repository, it means that it is cross-operating systems. However, if it is inside the `os/` folder, it will be specific to that operating system. This may happen because the application only exists on that OS or because the configurations are deeply ingrained in the OS.

- `git`: This folder contains specific configuration files for Github.

- `os/`: This folder contains specific setup and configs for different operating systems. Currently, only GNU/Linux is supported.

  - `.config/`: This folder contains specific configurations for the OS. For example, it may include configuration files for the desktop environment, the terminal emulator, or other system-wide settings.

  - `installation/`: This folder includes executables to install all the applications needed for the configurations to work. This can include dependencies and third-party applications.

  - `symlinks/`: This folder includes an executable that links the configurations of this repository to the ones in the system in a way that we only need to manage the configurations inside this repository (avoiding copy-pasting stuff). This makes it easy to update or modify the configurations without having to manually copy them over to the appropriate locations on the system.

  - `setup.sh`: This file is an executable that downloads all dependencies (if they do not exist in our system) and creates the links commented above. It automates the setup process and ensures that the configurations are properly installed and linked to the system.

- `shell`: This folder contains configurations for the different shells used in the system (in this case, zsh and bash).


## Credits

For building this dotfiles, I have used different resources to know how to structure, install and config my applications. Here are some of the resources that helped me:

- [rgomezcasas](https://github.com/rgomezcasas/dotfiles) and [CodelyTV](https://github.com/CodelyTV/dotfiles) for their dotfiles configurations, which served as the basis for the structure of this repository. 
- [Aaronidas](https://github.com/Aaronidas/my-workstation) for providing an easy and simple way on how to effectively install all the applications
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles), [thelinuxcast](https://gitlab.com/thelinuxcast/my-dots/-/tree/master), and the [Low Level Learning](https://www.youtube.com/c/LowLevelLearning) YouTube channel for giving me the knowledge about how to customize and optimize my setup. Some parts of the configuration in this repository are based on their work.

## Contributing

Feel free to explore this repository and use these dotfiles as a starting point for your own configurations. Don't hesitate to open an issue or submit a pull request if you have any suggestions or improvements to make.
