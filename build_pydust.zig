const std = @import("std");
const py = @import("./pydust.build.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const test_step = b.step("test", "Run library tests");

    const pydust = py.addPydust(b, .{
        .test_step = test_step,
    });

    _ = pydust.addPythonModule(.{
        .name = "termynus._lib",
        .root_source_file = .{ .path = "src/term_lib.zig" },
        .limited_api = true,
        .target = target,
        .optimize = optimize,
    });


}

