# Vulkan sample application for macOS with MoltenVK

This is the sample application for macOS with [MoltenVK](https://github.com/KhronosGroup/MoltenVK "MoltenVK"). This sample does not use GLFW, uses "VK_MVK_macos_surface" extension directly.
The graphics rendering of the sample application is based on [Vulkan Tutorial](https://vulkan-tutorial.com/ "Vulkan Tutorial").

## Convert GLSL to SPIR-V

$ MoltenVKShaderConverter -gi shader.vsh -so vert.spv
$ MoltenVKShaderConverter -gi shader.fsh -so frag.spv

## References
[MoltenVK](https://github.com/KhronosGroup/MoltenVK "MoltenVK")
[Vulkan Tutorial](https://vulkan-tutorial.com/ "Vulkan Tutorial")
[VK_MVK_macos_surface](https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#VkMacOSSurfaceCreateInfoMVK "VK_MVK_macos_surface")
