git pull
nasm -f bin src/mbr.asm -o pboot
#change for any extra files later on
export DISPLAY=:0.0
qemu-system-i386 pboot
