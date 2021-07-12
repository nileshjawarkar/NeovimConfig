# Neovim configuration

## Customization
* Create new lua module with name "custom" under <vim config directory>/lua directory
* And copy required files from default module to custom module.

## Java lsp (jdtls)
* Download jdtls from "https://download.eclipse.org/jdtls/milestones/?d"
* Extract it in some directory and create start_jdtls.sh (.bat - in cuase of windows) file in the same directory
  with the following contents. Please modify path as per your pc.

```bash
#!/usr/bin/env bash

JAR="$HOME/.local/lsp/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
GRADLE_HOME=$HOME/.local/lsp/gradle $HOME/.local/jdk11/bin/java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  -jar $(echo "$JAR") \
  -configuration "$HOME/.local/lsp/jdtls/config_linux" \
  -data "${1:-$HOME/Projects}" \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED
  
```
* Modify "custom/config.lua" to set jdtls lsp path. Please refer to defaults/config.lua file.

