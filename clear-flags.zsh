#!/bin/zsh

# The || true after each command ensures that the 
# script continues to the next command or file 
# even if a command fails.

# Iterate over all PDF files in the current directory
for file in *.pdf; do                        
  # Clear all user-level extended attributes
  xattr -c "$file" || true
  
  # Remove all Access Control Lists (ACLs)
  chmod -N "$file" || true
  
  # Set the file permissions to -rw-r--r-- (read and 
  # write for the owner, read for the group and others)
  chmod 644 "$file" || true
  
  # Set the file ownership to sbecker11:staff
  chown sbecker11:staff "$file" || true
  
  # Attempt to remove the com.apple.macl attribute
  xattr -d com.apple.macl "$file" || true
done