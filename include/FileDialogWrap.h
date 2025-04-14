#pragma once
#include <iostream>
#include <string>
#include <windows.h>

std::string create_open_file_dialog(std::string dialog_title, std::string filter);
std::string create_save_file_dialog(std::string dialog_title, std::string filter);