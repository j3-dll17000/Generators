; CreateMultipleRandomFiles.ahk
; This script prompts the user to specify a directory and the number of files to create, each with a random name, 3-letter extension, and random content

; Function to generate a random string of specified length
RandomString(length) {
    randomStr := ""
    characters := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    Loop, %length% {
        Random, randIndex, 1, StrLen(characters)
        randomStr .= SubStr(characters, randIndex, 1)
    }
    return randomStr
}

; Function to generate a random 3-letter extension
RandomExtension() {
    ext := ""
    characters := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    Loop, 3 {
        Random, randIndex, 1, StrLen(characters)
        ext .= SubStr(characters, randIndex, 1)
    }
    return ext
}

; Prompt the user to specify a directory
FileSelectFolder, directory, , 3, Please select the directory where you want to create the files.

; If the user cancels the selection, exit the script
if (directory = "")
{
    MsgBox, You canceled the selection.
    ExitApp
}

; Prompt the user to specify the number of files to create
InputBox, numFiles, Number of Files, Please enter the number of files to create:, , 300, 150

; If the user cancels the input, exit the script
if (ErrorLevel)
{
    MsgBox, You canceled the input.
    ExitApp
}

; Loop to create the specified number of files
Loop, %numFiles% {
    ; Generate a random file name and 3-letter extension
    fileName := RandomString(8) . "." . RandomExtension()

    ; Generate random content for the file
    content := RandomString(100)  ; Adjust the length as needed

    ; Combine the directory and filename to get the full path
    filePath := directory . "\" . fileName

    ; Create and write the random content to the file
    FileAppend, %content%, %filePath%
}

; Display a message box to confirm the file creation
MsgBox, %numFiles% file(s) created successfully in %directory%.
