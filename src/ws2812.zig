const std = @import("std");
pub const p = @cImport({
    //    @cInclude("stdio.h");
    @cInclude("pico/stdlib.h");
    @cInclude("stdio.h");

    @cInclude("hardware/gpio.h");
    @cInclude("pico/binary_info.h");
    @cInclude("ws2812.h");
    @cInclude("ws2812.pio.h");
    @cInclude("hardware/pio.h");
});


pub const RgbLed = struct {
    pio : u32,  // base register of the pio being used 
    sm: u8,     // sequence numner of the state machine
    pin: u8,   // rp2040 gpio that control the led
    red: u8,
    green: u8,
    blue: u8,
    rgbOn: bool,  // flag to say if led must be on or off
    inverted: bool,   // invert some colors because there is no standard in ws2812 led

    pub fn setRgbColor(self: *RgbLed, r: u8 , g:u8, b:u8) void{
        self.red = r;
        self.green = g;
        self.blue = b;
    }

    pub fn setRgbColorOn(self: *RgbLed, r: u8 , g:u8, b:u8) void{
        self.red = r;
        self.green = g;
        self.blue = b;
        self.setRgbOn();
    }


    pub fn setRgbOn(self:*RgbLed) void {
        self.rgbOn = true;
        var color:u32 = undefined;
        if (self.inverted ) {
            color = (@as(u32, self.green) << 16) | (@as(u32, self.red) << 24) | (@as(u32, self.blue) << 8) ; 
        } else {
            color = (@as(u32, self.red) << 16) | (@as(u32, self.green) << 24) | (@as(u32, self.blue) << 8) ; 
        }
        p.pio_sm_put_blocking(self.pio, self.sm , color);    
        //_ = p.printf("%x %u %x\n", self.pio, self.sm , color);
    }
    
    pub fn setRgbOff(self:*RgbLed) void {
        self.rgbOn = false;
        p.pio_sm_put_blocking(self.pio, self.sm , 0);
    }

    pub fn toggleRgb(self:*RgbLed) void {
        if (self.rgbOn) {
            self.setRgbOff();
        } else {
            self.setRgbOn();
        }
    }

    pub fn setupLed (self: *RgbLed ) void {           // initialize the pio and state machine
        if ((self.pin >= 0 ) and (self.pin <= 29 ) ){
            const offset : u32 = p.get_offset(self.pio);
            p.ws2812_program_init(self.pio, self.sm, offset, self.pin, 800000.0, false); // false because it is not a rgbw led
        }
    }

};    
