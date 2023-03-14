*** Settings ***
Library     OperatingSystem

*** Keywords ***
Import Keywords
    @{path}=  Get File  test/my_keywords/*.robot  # Get the path of all files in the folder
    FOR  ${file}  IN  @{path}  # Iterate over each file path
        Import Resource  ${file}  # Import the resource file
    END
