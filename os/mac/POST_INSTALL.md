# macOS Post-Install Steps

`make setup-mac` deja instalado Homebrew, formulas/casks, zim, symlinks, Claude Code y clave SSH nueva. Lo que queda son pasos que requieren interacción o credenciales.

## 0. Bootstrap en el Mac nuevo

```sh
# 1. Clonar el repo (usando HTTPS mientras no hay clave SSH todavía)
mkdir -p ~/projects
git clone https://github.com/alejandromc23/dotfiles.git ~/projects/dotfiles

# 2. Crear el symlink estándar
ln -s ~/projects/dotfiles ~/.dotfiles

# 3. Ejecutar el setup
cd ~/.dotfiles && make setup-mac
```

## 1. Clave SSH y GitHub

El script `install-ssh-key.sh` genera `~/.ssh/id_ed25519` y copia la pública al portapapeles.

1. Ir a https://github.com/settings/keys → **New SSH key** → pegar.
2. Probar: `ssh -T git@github.com`.
3. Cambiar el remote del repo a SSH si lo clonaste por HTTPS:
   ```sh
   cd ~/.dotfiles
   git remote set-url origin git@github.com:alejandromc23/dotfiles.git
   ```

## 2. GPG para commits firmados (Verified)

El `.gitconfig` referencia la signingkey `46D2DB3993213123`. Para que los commits sigan apareciendo como **Verified** con esa misma identidad, exportar la clave del Mac viejo y reimportarla en el nuevo.

### En el Mac viejo

```sh
# Exportar clave pública y privada
gpg --export --armor 46D2DB3993213123 > ~/Desktop/gpg-public.asc
gpg --export-secret-keys --armor 46D2DB3993213123 > ~/Desktop/gpg-private.asc
gpg --export-ownertrust > ~/Desktop/gpg-ownertrust.txt
```

Transferir los 3 archivos al Mac nuevo de forma segura (AirDrop cifrado, USB cifrado, 1Password, NordPass...). **No por Slack/email.**

### En el Mac nuevo

```sh
gpg --import ~/Desktop/gpg-public.asc
gpg --import ~/Desktop/gpg-private.asc
gpg --import-ownertrust < ~/Desktop/gpg-ownertrust.txt

# Verificar
gpg --list-secret-keys --keyid-format=long

# Borrar los archivos
rm ~/Desktop/gpg-public.asc ~/Desktop/gpg-private.asc ~/Desktop/gpg-ownertrust.txt
```

Configurar pinentry-mac (guarda la passphrase en el keychain):

```sh
mkdir -p ~/.gnupg
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
chmod 700 ~/.gnupg
gpgconf --kill gpg-agent
```

Probar firmando un commit vacío:

```sh
cd /tmp && git init demo && cd demo && git commit --allow-empty -m "test" -S
git log --show-signature -1
```

## 3. Permisos de macOS para yabai y skhd

**Accessibility + Screen Recording** son obligatorios:

1. `System Settings → Privacy & Security → Accessibility` → añadir `yabai` y `skhd`.
2. `System Settings → Privacy & Security → Screen Recording` → añadir `yabai`.

Arrancar los servicios:

```sh
brew services start skhd
yabai --start-service
```

### Scripting Addition de yabai (sudo sin contraseña)

Para que funcione `sudo yabai --load-sa` sin prompt, añadir esta regla a sudoers. Sustituir `<HASH>` por el resultado del comando:

```sh
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 /opt/homebrew/bin/yabai | awk '{print $1}') /opt/homebrew/bin/yabai --load-sa" | sudo tee /private/etc/sudoers.d/yabai
sudo chmod 440 /private/etc/sudoers.d/yabai
```

Para **deshabilitar SIP parcialmente** (requerido para algunas funciones avanzadas de yabai), ver https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection. Con la config actual (`layout float`) **no hace falta** deshabilitar SIP.

Reiniciar yabai después de dar permisos:

```sh
yabai --restart-service
```

## 4. Rectangle

1. Abrir **Rectangle** (primera ejecución pedirá Accessibility).
2. En sus settings, si lo usas junto a yabai, conviene desactivar atajos que colisionen con skhd (`alt+1/2/3`).

## 5. Claude Code

```sh
claude   # arranca el CLI y abre el flujo de login en navegador
```

Si usas cuenta Anthropic Console (API): `claude login`.
Si usas Claude.ai: elige esa opción en el flujo interactivo.

## 6. iTerm2

1. **Preferences → Profiles → Text → Font** → `Hack Nerd Font` (instalada por Brewfile).
2. Importar tu perfil/colores si los tenías guardados en `.itermcolors` (opcional).
3. **Preferences → General → Preferences** → marcar "Load preferences from a custom folder or URL" y apuntar a donde guardes el `.plist` si decides versionarlo más adelante.

## 7. NVM / Node

`nvm` ya está en `Brewfile` y `exports.sh` lo inicializa. Instalar una versión:

```sh
nvm install --lts
nvm alias default 'lts/*'
```

## 8. Comprobación final

```sh
which zsh                        # /opt/homebrew/bin/zsh
echo $SHELL                      # /opt/homebrew/bin/zsh
nvim --version | head -1
brew list | wc -l
ssh -T git@github.com
git log --show-signature -1      # en cualquier repo con commits firmados
yabai -m query --displays | head
skhd --version
claude --version
```
