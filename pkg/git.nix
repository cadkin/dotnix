{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        delta.enable = true;
        lfs.enable = true;

        userName  = "cadkin";
        userEmail = "cva@siliconslumber.net";

        delta.options = {
            decorations = {
                commit-decoration-style = "bold yellow box ul";
                file-decoration-style = "none";
                file-style = "bold yellow ul";
            };
            features = "decorations";
            whitespace-error-style = "22 reverse";
            navigate = true;
        };

        ignores = [
            # Temporary Files
            "*.swp"
            "*.bak"
            "*.tmp"
            "*.tmp.diff"
            "*.tmp.patch"

            # Prerequisites
            "*.d"

            # Compiled Object files
            "*.slo"
            "*.lo"
            "*.o"
            "*.obj"
            "*.ko"
            "*.elf"

            # Linker output
            "*.ilk"
            "*.map"
            "*.exp"

            # Precompiled Headers
            "*.gch"
            "*.pch"

            # Compiled Dynamic libraries
            "*.so"
            "*.dylib"

            # Fortran module files
            "*.mod"
            "*.smod"

            # Compiled Static libraries
            "*.lai"
            "*.la"
            "*.a"

            # Debug files
            "*.dSYM/"
            "*.su"
            "*.idb"
            "*.pdb"

            # Executables
            "*.exe"
            "*.out"
            "*.app"
            "*.i*86"
            "*.x86_64"
            "*.hex"
            "*.coe"

            # IDE files
            "*.pro.user"
            "*.autosave"
            "CMakeLists.txt.user"
            "CMakeCache.txt"
            "cmake-build-debug/"
            "cmake-build-release/"
            "cmake-build-relwithdebinfo/"
            ".idea/"
            ".vs/"

            # Binary files we don't want to accidentally track
            "*.3ds"
            "*.blend"
            "*.dae"
            "*.dxf"
            "*.fbx"
            "*.zip"
            "*.ilk"
            "*.pdb"
        ];

        extraConfig = {
            safe.directory = "*";
        };
    };
}
