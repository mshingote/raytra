#ifndef HW_PARSER_H
#define HW_PARSER_H

#include <vector>
#include "surface.h"
#include "camera.h"
#include "ray.h"
#include "sphere.h"

class Parser {
public:
    static int parse_file(std::string file_name,
                          std::vector<Surface*>& surfaces,
                          Camera& camera);
};

#endif //HW_PARSER_H
