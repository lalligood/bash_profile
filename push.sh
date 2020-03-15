#!/bin/bash

# Check that a modern python is installed, rename any existing shell files, &
# create symlinks to these file(s).

os=$(uname -s)
curr_dir=$(pwd)
curr_date=$(date +%Y%m%d)

verify_user()
# Only allow normal users to run this script!
{
    if [[ $(whoami) == 'root' ]]; then
        clear
        echo "**************************************************************"
        echo "THIS SCRIPT SHOULD ONLY BE RUN AS A NORMAL USER! Exiting . . ."
        echo "**************************************************************"
        echo
        exit 1
    fi
}

verify_python_version()
# Verify that a modern-ish version (3.6+) of python is installed
{
    python3 --version > /dev/null 2>&1
    if [[ $# > 0 ]]; then
        echo "PYTHON 3 IS NOT INSTALLED/ACCESSIBLE! Install & re-run this script."
        exit 1
    fi
    pyver=$(python3 --version | awk '{print $2}')
    pyminor=${pyver:2:1}
    if [[ ${pyminor} -ge 6 ]];then
        echo "Python ${pyver} installed. Continuing . . ."
    else
        echo "Install a more current version of python 3 & re-tun this script."
        exit 1
    fi
}

verify_os()
# Determine operating system & use OS-specific files
{
    if [[ ${os} == "Darwin" ]]; then
        echo "Found Mac OSX operating system"
        files=(.bash_profile .bash_aliases)
    else
        echo "Found Linux operating system"
        files=(.bashrc .bash_aliases)
    fi
}

rename_existing_files()
# If existing files are found, append `_YYYYMMDD` to filename
{
    echo "Renaming any existing .bash* files . . ."
    for each_file in ${files[@]};do
        if [[ -e $HOME/${each_file} ]];then
            mv -v $HOME/${each_file} $HOME/${each_file}_${curr_date}
        fi
    done
}

create_symlinks()
# Create symlinks for all necessary files
{
    echo "Creating symlinks to new config files . . ."
    for each_file in ${files[@]};do
        ln -vs ${curr_dir}/${each_file} $HOME/${each_file}
    done
}

verify_user
verify_python_version
verify_os
rename_existing_files
create_symlinks
