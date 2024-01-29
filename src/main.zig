const std = @import("std");
const l = @import("ws2812.zig");
pub const p = @cImport({
    //    @cInclude("stdio.h");
    @cInclude("pico/stdlib.h");
    @cInclude("stdio.h");
    @cInclude("hardware/gpio.h");
    @cInclude("pico/binary_info.h");
    @cInclude("ws2812.h");
    @cInclude("ws2812.pio.h"); // this file contains the pio program to handle the ws2812; it has been created outside this zig program.
    @cInclude("hardware/pio.h");
});

const pio1 = @as(u32,  0x50300000); // rp2040 base register adress of pio1, change the address to 0x50200000 if you want to use pio0
const sm : u8 = 3; // state machine being used 
const led_gpio = 16; // gpio of the led on a rp2040-zero
var rgbLed = l.RgbLed {.pio= pio1, .sm = sm, .pin = led_gpio, .red=0 , .green = 0, .blue =0 , .rgbOn = false , .inverted = false};

export fn zig_main() c_int {
    _ = p.stdio_init_all();    // let sdk initialize the rp2040
    rgbLed.setupLed();         // init a pio/sm to manage the led
    rgbLed.setRgbColor(0,0,10);   // select a color
    //rgbLed.setRgbOn();                   // turn led on (optional because it will be toggle in the loop)
    while (true) {
        p.sleep_ms(1000);
        _ = p.printf("Hello world\n");
        rgbLed.toggleRgb(); // switch led ON/OFF
    }
}


    


