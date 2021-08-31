#include "cmdline.h"
#include "sol/sol.hpp"


int main(int argc, char* argv[]) {

    cmdline::parser parser;
    parser.add<std::string>("path", 'p', "lua script path", true);
    parser.parse_check(argc, argv);
    std::string path = parser.get<std::string>("path");

    sol::state lua;
    lua.open_libraries();

    lua.script_file(path);
  
    return 0;
}