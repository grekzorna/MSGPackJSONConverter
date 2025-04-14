#include <iostream>
#include "FileDialogWrap.h"
#include <fstream>
#include <vector>
#include <tao/json.hpp>

std::string filename;
DWORD filesize;
std::string out;

std::string decryption(int begin_offset, int end_offset, std::string path);
std::string encryption(int begin_offset, int end_offset, std::string path);

int main(int argc, char** argv)
{
    printf("1 for MSGPack->JSON 2 for JSON->MSGPack\n");
    char choice;
    choice = getchar();
    filename = create_open_file_dialog("Choose a file to decrypt", "");
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    offset_choice:
    printf("Enter the beginning offset of the file: ");
    int begin_offset, end_offset;
    try {
        std::string input[2];
        std::getline(std::cin, input[0]);
        printf("Enter the ending offset of the file: ");
        std::getline(std::cin, input[1]);
        std::cout << "Input test: " << input[0] << " " << input[1] << std::endl;
        begin_offset = std::stoi(input[0], nullptr, 10);
        end_offset = std::stoi(input[1], nullptr, 10);
    }
    catch (const std::exception& e) {
        goto offset_choice;
    }
    switch (choice) {
        case '1':
            out = decryption(begin_offset, end_offset, filename);
            break;
        case '2':
            out += encryption(begin_offset, end_offset, filename);
            break;
    }
    std::string out_filename = create_save_file_dialog("Choose where to save", "");
    std::ofstream out_file(out_filename);
    out_file << out;
    return 0;
}

std::string decryption(int begin_offset, int end_offset, std::string path) {
    //Open File
    std::ifstream file(path, std::ios::binary);
    //Get File Contents to string
    std::string str_buffer((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    //Apply offsets
    str_buffer.erase(0, begin_offset);
    for (int i = 0; i < end_offset; i++) {
        str_buffer.pop_back();
    }
    //Write string buffer to json value (which converts it)
    tao::json::value v = tao::json::msgpack::from_string(str_buffer);
    std::string ret = tao::json::to_string(v, 2);
    return ret;
}

std::string encryption(int begin_offset, int end_offset, std::string path) {
    std::ifstream file(path, std::ios::binary);
    std::string str_buffer((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    str_buffer.erase(0, begin_offset);
    for (int i = 0; i < end_offset; i++) {
        str_buffer.pop_back();
    }
    tao::json::value v = tao::json::from_string(str_buffer);
    std::string ret = tao::json::msgpack::to_string(v);
    return ret;
}