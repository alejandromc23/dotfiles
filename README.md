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

## Setting System Up

To set up the system, there are two ways to proceed:

1. If you already have Git installed, from the root folder of your system, you can clone this repository by running the following command:

```
git clone git@github.com:alejandromc23/dotfiles.git
```

Once the repository is cloned, rename the folder to `.dotfiles` and execute the Makefile command that corresponds to your operating system from inside the `.dotfiles` folder. For instance, if you are using Linux, run the following command from the `.dotfiles` folder:

```
 make setup-linux
```

This will set up the system according to the configurations defined in this repository for your Linux system.

2. If you do not have Git installed, you can still download this repository using `curl`. To do so, run the following command:

```
curl -L https://github.com/alejandromc23/dotfiles/archive/refs/heads/main.zip -o dotfiles.zip
```

This will download a zipped version of the repository and save it as dotfiles.zip. Extract the contents of this zip file to a folder called .dotfiles inside your root directory. Next, execute the Makefile command that corresponds to your operating system, as described in the first method.

Please note that using the second method, you cannot use Git to update the repository or switch to different branches or commits. To get the latest version of the repository, you need to download it again using curl.

## Credits

For building this dotfiles, I have used different resources to know how to structure, install and config my applications. Here are some of the resources that helped me:

- [rgomezcasas](https://github.com/rgomezcasas/dotfiles) and [CodelyTV](https://github.com/CodelyTV/dotfiles) for their dotfiles configurations, which served as the basis for the structure of this repository. 
- [Aaronidas](https://github.com/Aaronidas/my-workstation) for providing an easy and simple way on how to effectively install all the applications
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles), [thelinuxcast](https://gitlab.com/thelinuxcast/my-dots/-/tree/master), and the [Low Level Learning](https://www.youtube.com/c/LowLevelLearning) YouTube channel for giving me the knowledge about how to customize and optimize my setup. Some parts of the configuration in this repository are based on their work.

## Contributing

Feel free to explore this repository and use these dotfiles as a starting point for your own configurations. Don't hesitate to open an issue or submit a pull request if you have any suggestions or improvements to make.
