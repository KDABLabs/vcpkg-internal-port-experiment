#include "b.h"

#include <a.h>
#include <common.h>

uint64_t b_get_value() {
    // with static analysis / clangd and "a" built as port,
    // when following a_get_value() via "go to declaration" or similar,
    // you should only end up in the header file. Not the implementation cpp file.
    return get_common_base_value() + a_get_value() + 11;
}
