git pull
nasm -f bin src/mbr.asm -o mbr
nasm -f bin src/stage2.asm -o 
cat mbr stage2 < pboot
# simply do "cat pboot kernel > os" to get the os image to be booted
export DISPLAY=:0.0
qemu-system-i386 pboot
