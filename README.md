# Vulkan sample application for macOS with MoltenVK

This is the sample application for macOS with [MoltenVK](https://github.com/KhronosGroup/MoltenVK "MoltenVK"). This sample does not use GLFW, uses "VK\_MVK\_macos\_surface" extension directly.
The graphics rendering part of the sample application is based on [Vulkan Tutorial](https://vulkan-tutorial.com/ "Vulkan Tutorial").

## Convert GLSL to SPIR-V

```
$ MoltenVKShaderConverter -gi shader.vsh -so vert.spv
$ MoltenVKShaderConverter -gi shader.fsh -so frag.spv
```

## References
* [MoltenVK](https://github.com/KhronosGroup/MoltenVK "MoltenVK")
* [Vulkan Tutorial](https://vulkan-tutorial.com/ "Vulkan Tutorial")
* [VK\_MVK\_macos\_surface](https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#VkMacOSSurfaceCreateInfoMVK "VK_MVK_macos_surface")
