ELF=image
HEX=$(ELF).hex

build:
	rm -rf zig-out
	#zig build 2>&1 | awk '{sub("${PWD}/", "")} 1'

	zig build-exe main.zig -target avr-freestanding -mcpu attiny412 --name image -O ReleaseSmall
	avr-objcopy -O ihex $(ELF) $(HEX)

	file $(ELF)
	size $(ELF)
	avr-objdump -ds $(ELF)