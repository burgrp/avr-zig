var stack: [10]u8 = .{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

var P: *volatile u8 = @ptrFromInt(0xABCD);

export fn _start() callconv(.Naked) noreturn {
    asm volatile (
        \\ nop
    );

    while (true) {
        for (0..9) |i| {
            P.* = @truncate(i);
        }
    }
}
