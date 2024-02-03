import os

def traverse_files(directory):
    for root, dirs, files in os.walk(directory):
        for file_name in files:
            if file_name.endswith(".sh"):  # Only operate on files with .sh extension
                file_path = os.path.join(root, file_name)
                with open(file_path, "r") as file:
                    file_content = file.read()

                # Replace strings
                replacement = "/usr/bin/env "
                file_content = file_content.replace("/usr/bin/env ", "<placeholder>")
                file_content = file_content.replace("/usr/bin/", replacement)
                file_content = file_content.replace("<placeholder>", "/usr/bin/env ")

                with open(file_path, "w") as file:
                    file.write(file_content)

                print("File", file_name, "has been updated!")
    
    print("Batch replace completed!")

# Get the current directory
current_dir = os.getcwd()

# Traverse files in the current directory
traverse_files(current_dir)
