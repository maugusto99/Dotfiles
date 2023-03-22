# Sincronizacion sistema

## Sync huso horario

```ln -sf /usr/share/zoneinfo/America/Argentina/Cordoba /etc/localtime```

## Sync horario con el hardware

```hwclock --systohc```

## Preparo el script para crear la configuracion de idioma

```sed -i '178s/.//' /etc/locale.gen```

## Idioma creo la configuracion de idioma del sistema

```locale-gen```

## Configuro el idioma en el sistema

```echo "LANG=en<sub>US</sub>.UTF-8" &gt;&gt; /etc/locale.conf```

## Configuracion teclado en la consola (No desktop enviorment)

```echo "KEYMAP=la-latin" &gt;&gt; /etc/vconsole.conf```

# Configuracion de Red

## Crear un hostname

```echo "arch" &gt;&gt; /etc/hostname```

## Configurar la red
```
echo "127.0.0.1 localhost" &gt;&gt; /etc/hosts echo "::1 localhost"
&gt;&gt; /etc/hosts echo "127.0.1.1 arch.localdomain arch" &gt;&gt;
/etc/hosts
```
# Poner pass para root

```echo root:password | chpasswd```

# Paquetes importantes a instalar

## Paquetes Básicos

### grub y componentes para boot en uefi

```grub efibootmgr```

### paquetes para configuracion de red

```networkmanager network-manager-applet dialog wpa_supplicant```

### paquetes importantes para compatibilidad de software

```base-devel linux-headers avahi nss-mdns```

### Crear carpetas para el usuario (si instalo un DE no hace falta)

```xdg-user-dirs xdg-utils```

### paquetes para manejar filesystem virtuales

```gvfs gvfs-smb nfs-utils inetutils dnsutils```

### Bluetooth

```bluez bluez-utils```

### Impresora

```cups cups-filters cups-pk-helper libcups python-pycups system-config-printer hplip ```
- add to /etc/nsswitch.conf

### Audio

```pipewire pipewire-alsa pipewire-pulse pipewire-jack```

### terminal utilidades
```
bash-completion zsh zsh-completions zsh-autosuggestions
zsh-syntax-highlighting
```
### Utilidades ssh y sync

```openssh rsync git```

### Miscelaneas (firmware, dnsutils y os-prober para detectar otros sistemas operativos)
```
reflector bridge-utils dnsmasq openbsd-netcat sof-firmware nss-mdns
os-prober mtools dosfstools xdg-user-dirs xdg-utils gvfs gvfs-smb
nfs-utils inetutils dnsutils ntfs-3g

```
### Drivers para nvidia

```nvidia nvidia-utils nvidia-settings```

### Actualizo microcode para intel

```intel-ucode```

### Bateria notebook

```acpi power-profile-manager```

### Arch utilities

```archlinux-contrib pacutils pacman-contrib```

## Entornos graficos

### Xfce, lightdm y web browser

```
xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4
xfce4-goodies firefox

```
### Qtile + mi customization

```amixer nm-applet alacritty feh picom ranger ueberzug```

1.  AUR packages

```qtile-git nerd-fonts-complete i3lock-color betterlockscreen```

# Bootloader

## Grub
```
grub-install --target=x86_64-efi --efi-directory=/boot
bootloader-id=GRUB

```
```grub-mkconfig -o /boot/grub/grub.cfg```

- change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

## Systemd-boot
```bootctl install```

- loader    ```esp/loader/loader.conf```

```
default  arch.conf
timeout  4
console-mode max
editor   no
  
```
- arch.conf     ```esp/loader/entries/arch.conf```

```
title Linux with Booster
linux /vmlinuz-linux
initrd /booster-linux.img
options root=UUID=f8b33cb6-aa8f-424b-aec8-25dd9239a0e7 rw lsm=landlock,lockdown,yama,integrity,apparmor,bpf nowatchdog rootflags=subvol=@

```

# Habilito los services

```
systemctl enable NetworkManager systemctl enable bluetooth systemctl
enable cups.service systemctl enable sshd systemctl enable avahi-daemon
systemctl enable reflector.timer

```
-   mejora la performance de un ssd

```systemctl enable fstrim.timer```

# Creo y añado un usuario con una carpeta home

```
useradd -m augustom echo augustom:password | chpasswd usermod -aG wheel
augustom

```
## Privilegios de sudo

uncomment wheel line in sudoers file
