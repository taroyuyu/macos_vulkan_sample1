#import <Foundation/Foundation.h>
#include "VKFileIO.hpp"

namespace vk {
  std::vector<char> readFile(const std::string &filename) {
    NSString *_filename = [NSString stringWithUTF8String:filename.c_str()];
    NSString *basename = [_filename stringByDeletingPathExtension];
    NSString *extension = [_filename pathExtension];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:basename withExtension:extension];
    NSData *data = [NSData dataWithContentsOfURL:url];
    const char *bytes = reinterpret_cast<const char *>(data.bytes);
    std::vector<char> result(bytes, bytes + data.length);
    return result;
  }
}
