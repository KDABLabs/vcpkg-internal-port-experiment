# vcpkg port of an in-source library for big monorepos

## Rationale
When you have a big monorepo: 
- clangd and other static analysis tools can get overloaded 
- full-rebuild compilation times can be very long

By selectively transitioning individual libraries to vcpkg ports, 
you can get caching of the built library and limit the scope for 
the static analysis tools to the header files.

## What to expect
Usually vcpkg pulls libraries from its online repository, this project
shows how you can turn your own libraries into ports.

# How to control if the library is a port or not

In this example repo, the library called "a" has the option
of being a port or not.

By configuring cmake with:

`-DBUILD_A_AS_PORT=OFF`

the library is built normally in CMake's main run scope.

`-DBUILD_A_AS_PORT=ON`

will transition it into a port.

# Architectural Considerations

If you have 2 libs, libX and libY, libY depending on libX,
when you want libY to be a port, you also have to make libX a port.

This is because vcpkg runs CMake in a subprocess and _before_ anything
else happens in the project.

As you may know, vcpkg piggy-backs on the `project()` statement in the
root CMakeLists.txt
