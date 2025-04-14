#include <FileDialogWrap.h>
std::string create_open_file_dialog(std::string dialog_title, std::string filter) {
#ifdef _WIN32
    OPENFILENAMEA ofn;
    char file_path[260];
    file_path[0] = '\0';

    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(ofn);
    ofn.hwndOwner = GetForegroundWindow();
    ofn.lpstrFile = file_path;
    ofn.nMaxFile = sizeof(file_path);
    ofn.lpstrFilter = filter.c_str();
    ofn.nFilterIndex = 1;
    ofn.lpstrFileTitle = NULL;
    ofn.nMaxFileTitle = 0;
    ofn.lpstrInitialDir = NULL;
    ofn.lpstrTitle = dialog_title.c_str();
    ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_OVERWRITEPROMPT;

    if(GetOpenFileNameA(&ofn) == TRUE) {
        std::string ret = file_path;
        return ret;
    }
    else {
        int errorCode = CommDlgExtendedError();
        if(errorCode != 0) {
            std::cout << "\nError from CommDlgExtendedError(): " << std::hex << CommDlgExtendedError() <<
            "\nMeaning at: https://learn.microsoft.com/en-us/windows/win32/api/commdlg/nf-commdlg-commdlgextendederror";
        }
        return "";
    }
#elifdef __linux__
    char buffer[1024];
    printf("\nWarning zenity package is required for unix systems for this to work\n");
    FILE* pipe = popen("zenity --file-selection --title=\"Select a file\"", "r");
    std::string filePath;
    if (fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        filePath = buffer;
        // Remove trailing newline if present
        if (!filePath.empty() && filePath.back() == '\n') {
            filePath.pop_back();
        }
    }
    pclose(pipe);
    return filePath;
    #endif
}

std::string create_save_file_dialog(std::string dialog_title, std::string filter) {
#ifdef _WIN32
    OPENFILENAMEA ofn;
    char file_path[260];
    file_path[0] = '\0';

    ZeroMemory(&ofn, sizeof(ofn));
    ofn.lStructSize = sizeof(ofn);
    ofn.hwndOwner = GetForegroundWindow();
    ofn.lpstrFile = file_path;
    ofn.nMaxFile = sizeof(file_path);
    ofn.lpstrFilter = filter.c_str();
    ofn.nFilterIndex = 1;
    ofn.lpstrFileTitle = NULL;
    ofn.nMaxFileTitle = 0;
    ofn.lpstrInitialDir = NULL;
    ofn.lpstrTitle = dialog_title.c_str();
    ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST | OFN_OVERWRITEPROMPT;

    if(GetSaveFileNameA(&ofn) == TRUE) {
        std::string ret = file_path;
        return ret;
    }
    else {
        int errorCode = CommDlgExtendedError();
        if(errorCode != 0) {
            std::cout << "\nError from CommDlgExtendedError(): " << std::hex << CommDlgExtendedError() <<
            "\nMeaning at: https://learn.microsoft.com/en-us/windows/win32/api/commdlg/nf-commdlg-commdlgextendederror";
        }
        return "";
    }
#elifdef __linux__
    char buffer[1024];
    printf("\nWarning zenity package is required for unix systems for this to work\n");
    FILE* pipe = popen("zenity --file-selection --save --confirm-overwrite --title=\"Save File As\"", "r");
    std::string filePath;
    if (fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        filePath = buffer;
        // Remove trailing newline if present
        if (!filePath.empty() && filePath.back() == '\n') {
            filePath.pop_back();
        }
    }
    pclose(pipe);
    return filePath;
#endif
}
