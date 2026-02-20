# 03 — Windows App SDK & WinUI (XAML + C#) — CLI approach

Purpose: add Windows App SDK (WinUI) dependencies and build WinUI apps from the CLI (no Visual Studio).

Notes up front
- Windows App SDK is distributed as NuGet packages (Microsoft.WindowsAppSDK / WinUI). You add them to your project file and build with MSBuild/dotnet CLI.
- Some project templates are easiest to create in Visual Studio; however existing projects can be built, tested and packaged entirely from the CLI.

Add Windows App SDK to a project
- In an SDK-style .csproj add a PackageReference (example):

```xml
<ItemGroup>
  <PackageReference Include="Microsoft.WindowsAppSDK" Version="1.8.0" />
</ItemGroup>
```

- Restore & build:
  - dotnet restore
  - dotnet build -c Release

Project file notes (example minimal snippet)
```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net10.0-windows10.0.19041.0</TargetFramework>
    <UseWinUI>true</UseWinUI>
    <OutputType>WinExe</OutputType>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.WindowsAppSDK" Version="1.8.0" />
  </ItemGroup>
</Project>
```

Build & run (CLI)
- dotnet restore
- dotnet build -c Release
- To run the built exe use the produced executable in `bin\Release\...` or install via MSIX (see packaging guide).

Workloads & runtime
- If your project uses additional workloads (native components), ensure the target Windows SDK + workloads are available on the build machine.

Where to get samples
- Microsoft publishes Windows App SDK samples on GitHub; you can clone and build them with `dotnet build` on Windows.
