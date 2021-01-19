#!/bin/sh

echo "Install Homebrew."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Now run visudo and add the line:"
echo "Defaults tty_tickets # Bind sudo privilege to a TTY."
