#ifndef VKFileIO_hpp
#define VKFileIO_hpp

#include <iostream>
#include <string>
#include <vector>

namespace vk {
  extern std::vector<char> readFile(const std::string &filename);
}

#endif /* VKFileIO_hpp */
