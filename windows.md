# Windows

## Install Windows

### Installing the Windows 11 developer VM on macOS Monterey

#### Install VirtualBox
```
brew install virtualbox
```
- Follow the instructions to update system settings and reboot

#### Get a Windows 11 development environment VM
- https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/
- unzip and open the archive, this will be import the VM
```
unzip WinDev2110Eval.VirtualBox.zip
open WinDev2110Eval.ova
rm WinDev2110Eval.*
```
- start the VM

#### Miscellaneous
- In Settings > Display, set the scale factor to 200%
- In Settings > Startup, switch the default terminal application to Windows Terminal

## Install Git
- Download the Windows installer from the official [Git] website
- Run the installer (git 2.34.1)
- Enable some optional settings:
  - Check daily for Git for Windows updates
  - Add Git bash profile to Windows Terminal
  - Use Visual Studio Code as Git's default editor
  - Override the default branch name for new repositories: main
  - Use external OpenSSH
  - Use the native Windows Secure Channel library
  - Enable experimental support for pseudo consoles
  - Enable experimental built-in file system monitor
- Default settings of note:
  - Convert to Windows-style line endings on checkout
  - Use MinTTY for terminal emulation
  - Enable symbolic links
  - Adjust PATH to use git from the command line
[git]: https://git-scm.com

## Configure Git
```
git config --global user.email you@example.com
git config --global user.name "Your Name"
```
## Install Python
### Installing the current release of Python
- Download the recommended Windows installer for Python 3.10.0 from the official [Python] website
- Run the installer
  - Enable the option to add Python to the `PATH` environment variable
  - Click **Install now**
- In the Windows terminal, the output of `py -VV` should contain the installed version (3.10.0)
[python]: https://www.python.org/

### Installing the latest bugfix release for the previous version of Python
- Download the recommended Windows installer for Python 3.9.9 from the official [Python] website
- Run the installer (**Install now**)
  - Do *not* enable the option to add Python to the `PATH` environment variable
- In the Windows terminal, the output of `py -3.9 -VV` should contain the installed version (3.9.9)

### Installing the latest security release for an older version of Python
Binary installers are not provided for security releases. So there are two
options:

1. Use the binary installer for the latest bugfix release (see steps above). The
   latest bugfix releases are 3.8.10 and 3.7.9.

2. Build the latest security release from source. The latest security releases
   are 3.8.12 and 3.7.12.

### Installing a prerelease for the next version of Python
- Download the recommended Windows installer for Python 3.11.0a2 from the official [Python] website
- Run the installer (**Install now**)
  - Do *not* enable the option to add Python to the `PATH` environment variable
- In the Windows terminal, the output of `py -3.11 -VV` should contain the installed version (3.11.0a2)
- Configure the Python Launcher for Windows to use the stable release by default:
  ```
  code %LOCALAPPDATA%\py.ini
  ```

  ```ini
  [defaults]
  python=3.10
  ```
- In the Windows terminal, the output of `py -VV` should contain the stable version (3.10.0)

## Install Poetry
- Use the following commands in a PowerShell prompt:
  ```
  wget https://install.python-poetry.org -OutFile install-poetry.py
  py install-poetry.py
  ```
- Add the location of Poetry to your `PATH` environment variable
  - Settings > Environment Variables > Path > Edit > New
  - Use the location printed by the second command. For me, this was (the
    equivalent of) `%APPDATA%\Python\Scripts`.
- Restart Windows Terminal, and verify that everything worked:
  ```
  poetry --version
  ```

### Upgrade pip
- Use the following commands in a PowerShell prompt:
  ```
  py -m pip install --upgrade pip
  ```
- You may want to repeat this command for any other installed versions of
  Python, for example:
  ```
  py -3.11 -m pip install --upgrade pip
  ```
- There will be a warning about `pip.exe` not being on `PATH`. Do *not* add the
  location to your `PATH`. We only ever invoke this installation via the Python
  Launcher `py`. Adding additional Python installations to your `PATH` may
  shadow your default Python installation with old versions or prereleases of
  Python, and makes it harder to diagnose errors.

### Install pipx
- Use the following commands in a PowerShell prompt:
  ```
  py -m pip install --user pipx
  py -m pipx ensurepath
  ```
- Restart Windows Terminal, and verify that everything worked:
  ```
  pipx --version
  ```

### Install Nox and nox-poetry
- Use the following commands in a PowerShell prompt:
  ```
  pipx install nox
  pipx inject nox nox-poetry
  ```
- Verify that everything worked:
  ```
  nox --version
  ```
