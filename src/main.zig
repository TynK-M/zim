const std = @import("std");
const builtin = @import("builtin");
const dvui = @import("dvui");
const SDLBackend = @import("sdl-backend");

const window_icon_png = @embedFile("zim-favicon.png");

pub const dvui_app: dvui.App = .{
    .config = .{
        .options = .{
            .size = .{ .w = 800.0, .h = 600.0 },
            .min_size = .{ .w = 250.0, .h = 350.0 },
            .title = "Zim",
            .icon = window_icon_png,
            .window_init_options = .{
                .theme = dvui.Theme.builtin.dracula,
            },
        },
    },
    .frameFn = appFrame,
    .initFn = appInit,
    .deinitFn = appDeinit,
};
pub const main = dvui.App.main;
pub const panic = dvui.App.panic;
pub const std_options: std.Options = .{
    .logFn = dvui.App.logFn,
};

var gpa_instance = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = gpa_instance.allocator();

var orig_content_scale: f32 = 1.0;
var warn_on_quit: bool = true;
var warn_on_quit_closing: bool = true;
var extra_os_win: bool = false;

pub fn appInit(win: *dvui.Window) !void {
    orig_content_scale = win.content_scale;
}

pub fn appDeinit() void {}

pub fn appFrame() !dvui.App.Result {
    return .ok;
}
